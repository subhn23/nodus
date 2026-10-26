import 'dart:io';
import 'dart:typed_data';
import 'package:crypto/crypto.dart';
import 'package:path/path.dart' as p;

/// Content-Addressable Storage (CAS) file manager.
/// Stores binary attachments identified by their cryptographic SHA-256 hash.
class BlobManager {
  final Directory baseDirectory;

  BlobManager({required this.baseDirectory});

  /// The directory where physical CAS blobs are saved.
  Directory get blobsDirectory => Directory(p.join(baseDirectory.path, 'blobs'));

  /// Ensures the blobs directory exists on disk.
  Future<void> ensureInitialized() async {
    if (!await blobsDirectory.exists()) {
      await blobsDirectory.create(recursive: true);
    }
  }

  /// Calculates SHA-256 hash of provided bytes.
  String computeSha256(List<int> bytes) {
    return sha256.convert(bytes).toString();
  }

  /// Physical file location for a given [sha256Hash].
  File getBlobFile(String sha256Hash) {
    return File(p.join(blobsDirectory.path, sha256Hash));
  }

  /// Stores binary [bytes] into CAS.
  /// If an identical blob already exists, writes are skipped (deduplication).
  /// Returns a record with `(hash, byteSize, isNew)`.
  Future<({String hash, int byteSize, bool isNew})> putBytes(List<int> bytes) async {
    await ensureInitialized();
    final hash = computeSha256(bytes);
    final file = getBlobFile(hash);

    if (await file.exists()) {
      final size = await file.length();
      return (hash: hash, byteSize: size, isNew: false);
    }

    await file.writeAsBytes(bytes, flush: true);
    return (hash: hash, byteSize: bytes.length, isNew: true);
  }

  /// Reads physical binary bytes for a given [sha256Hash].
  /// Returns `null` if the blob does not exist on disk.
  Future<Uint8List?> getBytes(String sha256Hash) async {
    final file = getBlobFile(sha256Hash);
    if (!await file.exists()) {
      return null;
    }
    return await file.readAsBytes();
  }

  /// Checks if a blob exists on disk.
  Future<bool> hasBlob(String sha256Hash) async {
    return await getBlobFile(sha256Hash).exists();
  }

  /// Physically deletes a blob file from disk (e.g. during orphan cleanup).
  Future<bool> deleteBlob(String sha256Hash) async {
    final file = getBlobFile(sha256Hash);
    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }

  /// Calculates total bytes consumed by all physical CAS blobs.
  Future<int> getTotalStorageBytes() async {
    if (!await blobsDirectory.exists()) return 0;
    int total = 0;
    await for (final entity in blobsDirectory.list(followLinks: false)) {
      if (entity is File) {
        total += await entity.length();
      }
    }
    return total;
  }

  /// Lists all on-disk blob hashes.
  Future<List<String>> listBlobHashes() async {
    if (!await blobsDirectory.exists()) return [];
    final hashes = <String>[];
    await for (final entity in blobsDirectory.list(followLinks: false)) {
      if (entity is File) {
        hashes.add(p.basename(entity.path));
      }
    }
    return hashes;
  }
}
