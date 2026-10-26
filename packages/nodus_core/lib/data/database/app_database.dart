import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'tables/notebooks_table.dart';
import 'tables/sections_table.dart';
import 'tables/pages_table.dart';
import 'tables/note_blocks_table.dart';
import 'tables/tasks_table.dart';
import 'tables/blobs_table.dart';
import 'daos/notes_dao.dart';
import 'daos/search_dao.dart';

part 'app_database.g.dart';

@DriftDatabase(
  tables: [
    NotebooksTable,
    SectionsTable,
    PagesTable,
    NoteBlocksTable,
    TasksTable,
    BlobsTable,
  ],
  daos: [
    NotesDao,
    SearchDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase(super.e);

  /// Factory for in-memory SQLite database, ideal for fast, isolated unit tests.
  factory AppDatabase.inMemory({bool logStatements = false}) {
    return AppDatabase(
      NativeDatabase.memory(logStatements: logStatements),
    );
  }

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (m) async {
        await m.createAll();

        // Initialize SQLite FTS5 virtual table for full-text searching
        await customStatement('''
          CREATE VIRTUAL TABLE IF NOT EXISTS pages_fts USING fts5(
            page_id UNINDEXED,
            title,
            body_text,
            tags,
            code_snippets,
            tokenize = 'porter unicode61'
          );
        ''');
      },
      beforeOpen: (details) async {
        // Enforce foreign key constraints in SQLite
        await customStatement('PRAGMA foreign_keys = ON;');
      },
    );
  }
}
