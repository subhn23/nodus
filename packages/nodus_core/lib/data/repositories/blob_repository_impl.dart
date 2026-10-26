import 'dart:typed_data';
import '../../domain/repositories/blob_repository.dart';
import '../cas/blob_manager.dart';
import '../database/daos/notes_dao.dart';

/// Concrete implementation of [IBlobRepository] using [BlobManager] and [NotesDao].
class BlobRepositoryImpl implements IBlobRepository {
  final BlobManager blobManager;
  final NotesDao notesDao;

  BlobRepositoryImpl({
    required this.blobManager,
    required this.notesDao,
  });

  @override
  Future<({String hash, int byteSize, bool isNew})> putBlob(List<int> bytes) async {
    final result = await blobManager.putBytes(bytes);
    await notesDao.registerBlob(
      hash: result.hash,
      byteSize: result.byteSize,
    );
    return result;
  }

  @override
  Future<Uint8List?> getBlob(String hash) {
    return blobManager.getBytes(hash);
  }

  @override
  Future<bool> hasBlob(String hash) {
    return blobManager.hasBlob(hash);
  }

  @override
  Future<bool> deleteBlob(String hash) async {
    await notesDao.deleteBlobMeta(hash);
    return await blobManager.deleteBlob(hash);
  }

  @override
  Future<int> getTotalStorageBytes() {
    return blobManager.getTotalStorageBytes();
  }

  @override
  Future<List<String>> getOrphanBlobHashes() async {
    final orphans = await notesDao.getOrphanBlobs();
    return orphans.map((b) => b.hash).toList();
  }
}
