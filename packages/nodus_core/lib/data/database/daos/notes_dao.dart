import 'package:drift/drift.dart';
import '../app_database.dart';
import '../tables/notebooks_table.dart';
import '../tables/sections_table.dart';
import '../tables/pages_table.dart';
import '../tables/note_blocks_table.dart';
import '../tables/tasks_table.dart';
import '../tables/blobs_table.dart';

part 'notes_dao.g.dart';

@DriftAccessor(
  tables: [
    NotebooksTable,
    SectionsTable,
    PagesTable,
    NoteBlocksTable,
    TasksTable,
    BlobsTable,
  ],
)
class NotesDao extends DatabaseAccessor<AppDatabase> with _$NotesDaoMixin {
  NotesDao(super.db);

  // ---------------------------------------------------------------------------
  // Notebooks
  // ---------------------------------------------------------------------------
  Future<List<NotebooksTableData>> getAllNotebooks() {
    return (select(notebooksTable)
          ..where((t) => t.deletedAtHlc.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]))
        .get();
  }

  Future<void> upsertNotebook(NotebooksTableCompanion companion) {
    return into(notebooksTable).insertOnConflictUpdate(companion);
  }

  Future<void> softDeleteNotebook(String id, String deletedAtHlc) {
    return (update(notebooksTable)..where((t) => t.id.equals(id)))
        .write(NotebooksTableCompanion(deletedAtHlc: Value(deletedAtHlc)));
  }

  // ---------------------------------------------------------------------------
  // Sections
  // ---------------------------------------------------------------------------
  Future<List<SectionsTableData>> getSectionsForNotebook(String notebookId) {
    return (select(sectionsTable)
          ..where((t) => t.notebookId.equals(notebookId) & t.deletedAtHlc.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]))
        .get();
  }

  Future<void> upsertSection(SectionsTableCompanion companion) {
    return into(sectionsTable).insertOnConflictUpdate(companion);
  }

  Future<void> softDeleteSection(String id, String deletedAtHlc) {
    return (update(sectionsTable)..where((t) => t.id.equals(id)))
        .write(SectionsTableCompanion(deletedAtHlc: Value(deletedAtHlc)));
  }

  // ---------------------------------------------------------------------------
  // Pages
  // ---------------------------------------------------------------------------
  Future<List<PagesTableData>> getPagesForSection(String sectionId) {
    return (select(pagesTable)
          ..where((t) => t.sectionId.equals(sectionId) & t.deletedAtHlc.isNull())
          ..orderBy([
            (t) => OrderingTerm(expression: t.isPinned, mode: OrderingMode.desc),
            (t) => OrderingTerm(expression: t.sortOrder),
          ]))
        .get();
  }

  Future<PagesTableData?> getPageById(String id) {
    return (select(pagesTable)..where((t) => t.id.equals(id))).getSingleOrNull();
  }

  Future<void> upsertPage(PagesTableCompanion companion) {
    return into(pagesTable).insertOnConflictUpdate(companion);
  }

  Future<void> softDeletePage(String id, String deletedAtHlc) {
    return (update(pagesTable)..where((t) => t.id.equals(id)))
        .write(PagesTableCompanion(deletedAtHlc: Value(deletedAtHlc)));
  }

  // ---------------------------------------------------------------------------
  // NoteBlocks
  // ---------------------------------------------------------------------------
  Future<List<NoteBlocksTableData>> getBlocksForPage(String pageId) {
    return (select(noteBlocksTable)
          ..where((t) => t.pageId.equals(pageId) & t.deletedAtHlc.isNull())
          ..orderBy([(t) => OrderingTerm(expression: t.sortOrder)]))
        .get();
  }

  Future<void> upsertBlock(NoteBlocksTableCompanion companion) {
    return into(noteBlocksTable).insertOnConflictUpdate(companion);
  }

  Future<void> batchSaveBlocks(List<NoteBlocksTableCompanion> companions) {
    return batch((b) {
      b.insertAllOnConflictUpdate(noteBlocksTable, companions);
    });
  }

  Future<void> softDeleteBlock(String id, String deletedAtHlc) {
    return (update(noteBlocksTable)..where((t) => t.id.equals(id)))
        .write(NoteBlocksTableCompanion(deletedAtHlc: Value(deletedAtHlc)));
  }

  // ---------------------------------------------------------------------------
  // Blobs (CAS Metadata)
  // ---------------------------------------------------------------------------
  Future<BlobsTableData?> getBlobMeta(String hash) {
    return (select(blobsTable)..where((t) => t.hash.equals(hash))).getSingleOrNull();
  }

  /// Inserts a new blob metadata record or increments referenceCount if it exists.
  Future<void> registerBlob({
    required String hash,
    required int byteSize,
    String? mimeType,
    String? originalName,
  }) async {
    final existing = await getBlobMeta(hash);
    if (existing != null) {
      await (update(blobsTable)..where((t) => t.hash.equals(hash))).write(
        BlobsTableCompanion(
          referenceCount: Value(existing.referenceCount + 1),
        ),
      );
    } else {
      await into(blobsTable).insert(
        BlobsTableCompanion.insert(
          hash: hash,
          byteSize: byteSize,
          mimeType: Value(mimeType),
          originalName: Value(originalName),
          referenceCount: const Value(1),
        ),
      );
    }
  }

  /// Decrements reference count when a note removes an attachment.
  Future<void> decrementBlobReference(String hash) async {
    final existing = await getBlobMeta(hash);
    if (existing != null && existing.referenceCount > 0) {
      await (update(blobsTable)..where((t) => t.hash.equals(hash))).write(
        BlobsTableCompanion(
          referenceCount: Value(existing.referenceCount - 1),
        ),
      );
    }
  }

  /// Retrieves all blobs that have 0 references (orphans).
  Future<List<BlobsTableData>> getOrphanBlobs() {
    return (select(blobsTable)..where((t) => t.referenceCount.isSmallerOrEqualValue(0))).get();
  }

  /// Deletes a blob metadata record permanently.
  Future<int> deleteBlobMeta(String hash) {
    return (delete(blobsTable)..where((t) => t.hash.equals(hash))).go();
  }

  // ---------------------------------------------------------------------------
  // Tasks (Dual-Write Relational Table)
  // ---------------------------------------------------------------------------
  Future<List<TasksTableData>> getTasksForPage(String pageId) {
    return (select(tasksTable)..where((t) => t.pageId.equals(pageId))).get();
  }

  Future<List<TasksTableData>> getAllActiveTasks() {
    return (select(tasksTable)
          ..where((t) => t.isCompleted.equals(false))
          ..orderBy([(t) => OrderingTerm(expression: t.dueDate)]))
        .get();
  }

  Future<void> upsertTask(TasksTableCompanion companion) {
    return into(tasksTable).insertOnConflictUpdate(companion);
  }

  Future<void> setTaskCompleted(String id, bool isCompleted) {
    return (update(tasksTable)..where((t) => t.id.equals(id))).write(
      TasksTableCompanion(isCompleted: Value(isCompleted)),
    );
  }
}
