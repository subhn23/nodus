import 'dart:typed_data';

/// Contract for Content-Addressable Storage (CAS) operations.
abstract class IBlobRepository {
  Future<({String hash, int byteSize, bool isNew})> putBlob(List<int> bytes);
  Future<Uint8List?> getBlob(String hash);
  Future<bool> hasBlob(String hash);
  Future<bool> deleteBlob(String hash);
  Future<int> getTotalStorageBytes();
  Future<List<String>> getOrphanBlobHashes();
}
