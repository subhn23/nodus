import 'package:drift/drift.dart' hide isNull, isNotNull;
import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

void main() {
  group('AppDatabase & NotesDao In-Memory SQLite TDD', () {
    late AppDatabase db;
    late NotesDao notesDao;

    setUp(() {
      db = AppDatabase.inMemory();
      notesDao = db.notesDao;
    });

    tearDown(() async {
      await db.close();
    });

    test('performs CRUD operations for notebooks hierarchy', () async {
      final hlc = Hlc(millis: 1000, counter: 0, nodeId: 'node-1').encode();

      // 1. Insert Notebook
      await notesDao.upsertNotebook(
        NotebooksTableCompanion.insert(
          id: 'nb-1',
          name: 'Cybersecurity Notes',
          sortOrder: const Value(1.0),
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
      );

      final notebooks = await notesDao.getAllNotebooks();
      expect(notebooks.length, equals(1));
      expect(notebooks.first.name, equals('Cybersecurity Notes'));

      // 2. Insert Section
      await notesDao.upsertSection(
        SectionsTableCompanion.insert(
          id: 'sec-1',
          notebookId: 'nb-1',
          name: 'Network Reconnaissance',
          sortOrder: const Value(1.0),
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
      );

      final sections = await notesDao.getSectionsForNotebook('nb-1');
      expect(sections.length, equals(1));
      expect(sections.first.name, equals('Network Reconnaissance'));

      // 3. Insert Page
      await notesDao.upsertPage(
        PagesTableCompanion.insert(
          id: 'page-1',
          sectionId: 'sec-1',
          title: 'Nmap Scanning Methodology',
          sortOrder: const Value(1.0),
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
      );

      final pages = await notesDao.getPagesForSection('sec-1');
      expect(pages.length, equals(1));
      expect(pages.first.title, equals('Nmap Scanning Methodology'));
    });

    test('stores polymorphic blocks with CRDT state and fractional sort order', () async {
      final hlc = Hlc(millis: 1000, counter: 0, nodeId: 'node-1').encode();

      // Setup notebook, section, page
      await notesDao.upsertNotebook(NotebooksTableCompanion.insert(
        id: 'nb-1', name: 'NB', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));
      await notesDao.upsertSection(SectionsTableCompanion.insert(
        id: 'sec-1', notebookId: 'nb-1', name: 'Sec', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));
      await notesDao.upsertPage(PagesTableCompanion.insert(
        id: 'page-1', sectionId: 'sec-1', title: 'Page', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));

      final crdtDeltaBytes = Uint8List.fromList([0x01, 0x02, 0x03, 0x04]);

      // Insert 3 blocks with fractional sort orders
      await notesDao.batchSaveBlocks([
        NoteBlocksTableCompanion.insert(
          id: 'block-1',
          pageId: 'page-1',
          blockType: 'heading',
          sortOrder: const Value(1.0),
          content: '{"level": 1, "text": "Recon Overview"}',
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
        NoteBlocksTableCompanion.insert(
          id: 'block-3',
          pageId: 'page-1',
          blockType: 'terminal',
          sortOrder: const Value(2.0),
          content: '{"command": "nmap -sV target", "exitCode": 0}',
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
        NoteBlocksTableCompanion.insert(
          id: 'block-2',
          pageId: 'page-1',
          blockType: 'code',
          sortOrder: const Value(1.5), // Inserted in between!
          content: '{"lang": "bash", "source": "nmap -sV"}',
          crdtState: Value(crdtDeltaBytes),
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
      ]);

      final blocks = await notesDao.getBlocksForPage('page-1');
      expect(blocks.length, equals(3));
      // Verify ordering by sortOrder: 1.0, 1.5, 2.0
      expect(blocks[0].id, equals('block-1'));
      expect(blocks[1].id, equals('block-2'));
      expect(blocks[2].id, equals('block-3'));

      // Verify CRDT binary delta was stored and retrieved intact
      expect(blocks[1].crdtState, equals(crdtDeltaBytes));
    });

    test('manages CAS metadata, deduplication reference counts, and detects orphans', () async {
      const shaHash = 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855';

      // 1. Initial registration
      await notesDao.registerBlob(
        hash: shaHash,
        byteSize: 1024,
        mimeType: 'image/webp',
        originalName: 'network_diagram.webp',
      );

      var meta = await notesDao.getBlobMeta(shaHash);
      expect(meta, isNotNull);
      expect(meta!.referenceCount, equals(1));

      // 2. Second registration of same hash increments reference count (deduplication)
      await notesDao.registerBlob(
        hash: shaHash,
        byteSize: 1024,
      );

      meta = await notesDao.getBlobMeta(shaHash);
      expect(meta!.referenceCount, equals(2));

      // 3. Decrementing reference count
      await notesDao.decrementBlobReference(shaHash);
      meta = await notesDao.getBlobMeta(shaHash);
      expect(meta!.referenceCount, equals(1));

      // 4. Decrement to 0 becomes an orphan
      await notesDao.decrementBlobReference(shaHash);
      meta = await notesDao.getBlobMeta(shaHash);
      expect(meta!.referenceCount, equals(0));

      final orphans = await notesDao.getOrphanBlobs();
      expect(orphans.length, equals(1));
      expect(orphans.first.hash, equals(shaHash));

      // 5. Cleanup
      await notesDao.deleteBlobMeta(shaHash);
      expect(await notesDao.getBlobMeta(shaHash), isNull);
    });

    test('manages dual-write tasks table', () async {
      final hlc = Hlc(millis: 1000, counter: 0, nodeId: 'node-1').encode();

      await notesDao.upsertNotebook(NotebooksTableCompanion.insert(
        id: 'nb-1', name: 'NB', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));
      await notesDao.upsertSection(SectionsTableCompanion.insert(
        id: 'sec-1', notebookId: 'nb-1', name: 'Sec', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));
      await notesDao.upsertPage(PagesTableCompanion.insert(
        id: 'page-1', sectionId: 'sec-1', title: 'Page', createdAtHlc: hlc, updatedAtHlc: hlc,
      ));
      await notesDao.upsertBlock(NoteBlocksTableCompanion.insert(
        id: 'block-1', pageId: 'page-1', blockType: 'task', content: '- [ ] Configure NGINX',
        createdAtHlc: hlc, updatedAtHlc: hlc,
      ));

      // Insert task
      await notesDao.upsertTask(
        TasksTableCompanion.insert(
          id: 'task-1',
          blockId: 'block-1',
          pageId: 'page-1',
          title: 'Configure NGINX reverse proxy',
          priority: const Value('high'),
          status: const Value('todo'),
          createdAtHlc: hlc,
          updatedAtHlc: hlc,
        ),
      );

      final activeTasks = await notesDao.getAllActiveTasks();
      expect(activeTasks.length, equals(1));
      expect(activeTasks.first.title, equals('Configure NGINX reverse proxy'));
      expect(activeTasks.first.priority, equals('high'));

      // Complete task
      await notesDao.setTaskCompleted('task-1', true);
      final remainingActive = await notesDao.getAllActiveTasks();
      expect(remainingActive.isEmpty, isTrue);
    });
  });
}
