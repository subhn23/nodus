// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notes_dao.dart';

// ignore_for_file: type=lint
mixin _$NotesDaoMixin on DatabaseAccessor<AppDatabase> {
  $NotebooksTableTable get notebooksTable => attachedDatabase.notebooksTable;
  $SectionsTableTable get sectionsTable => attachedDatabase.sectionsTable;
  $PagesTableTable get pagesTable => attachedDatabase.pagesTable;
  $NoteBlocksTableTable get noteBlocksTable => attachedDatabase.noteBlocksTable;
  $TasksTableTable get tasksTable => attachedDatabase.tasksTable;
  $BlobsTableTable get blobsTable => attachedDatabase.blobsTable;
  NotesDaoManager get managers => NotesDaoManager(this);
}

class NotesDaoManager {
  final _$NotesDaoMixin _db;
  NotesDaoManager(this._db);
  $$NotebooksTableTableTableManager get notebooksTable =>
      $$NotebooksTableTableTableManager(
        _db.attachedDatabase,
        _db.notebooksTable,
      );
  $$SectionsTableTableTableManager get sectionsTable =>
      $$SectionsTableTableTableManager(_db.attachedDatabase, _db.sectionsTable);
  $$PagesTableTableTableManager get pagesTable =>
      $$PagesTableTableTableManager(_db.attachedDatabase, _db.pagesTable);
  $$NoteBlocksTableTableTableManager get noteBlocksTable =>
      $$NoteBlocksTableTableTableManager(
        _db.attachedDatabase,
        _db.noteBlocksTable,
      );
  $$TasksTableTableTableManager get tasksTable =>
      $$TasksTableTableTableManager(_db.attachedDatabase, _db.tasksTable);
  $$BlobsTableTableTableManager get blobsTable =>
      $$BlobsTableTableTableManager(_db.attachedDatabase, _db.blobsTable);
}
