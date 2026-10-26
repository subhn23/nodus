import 'dart:io';
import 'package:test/test.dart';
import 'package:nodus_core/data/cas/blob_manager.dart';

void main() {
  group('BlobManager (Content-Addressable Storage)', () {
    late Directory tempDir;
    late BlobManager blobManager;

    setUp(() async {
      tempDir = await Directory.systemTemp.createTemp('nodus_cas_test_');
      blobManager = BlobManager(baseDirectory: tempDir);
    });

    tearDown(() async {
      if (await tempDir.exists()) {
        await tempDir.delete(recursive: true);
      }
    });

    test('stores bytes and computes exact SHA-256 hash', () async {
      final sampleData = 'Nodus technical note content with binary data'.codeUnits;
      final result = await blobManager.putBytes(sampleData);

      expect(result.isNew, isTrue);
      expect(result.byteSize, equals(sampleData.length));
      expect(result.hash.length, equals(64));

      final retrieved = await blobManager.getBytes(result.hash);
      expect(retrieved, isNotNull);
      expect(retrieved, equals(sampleData));
    });

    test('deduplicates identical byte arrays without rewriting physical file', () async {
      final sampleData = 'Deduplication test data payload'.codeUnits;

      final firstPut = await blobManager.putBytes(sampleData);
      expect(firstPut.isNew, isTrue);

      final secondPut = await blobManager.putBytes(sampleData);
      expect(secondPut.isNew, isFalse);
      expect(secondPut.hash, equals(firstPut.hash));

      final list = await blobManager.listBlobHashes();
      expect(list.length, equals(1));
    });

    test('deletes blob and updates storage metrics', () async {
      final data1 = 'Payload 1'.codeUnits;
      final data2 = 'Payload 2'.codeUnits;

      final res1 = await blobManager.putBytes(data1);
      final res2 = await blobManager.putBytes(data2);
      expect(res2.isNew, isTrue);

      final totalBefore = await blobManager.getTotalStorageBytes();
      expect(totalBefore, equals(data1.length + data2.length));

      final deleted = await blobManager.deleteBlob(res1.hash);
      expect(deleted, isTrue);
      expect(await blobManager.hasBlob(res1.hash), isFalse);

      final totalAfter = await blobManager.getTotalStorageBytes();
      expect(totalAfter, equals(data2.length));
    });
  });
}
