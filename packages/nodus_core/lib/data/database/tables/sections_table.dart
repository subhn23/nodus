import 'package:drift/drift.dart';
import 'notebooks_table.dart';

/// Relational table definition for Sections belonging to Notebooks.
class SectionsTable extends Table {
  @override
  String get tableName => 'sections';

  TextColumn get id => text()();
  TextColumn get notebookId => text().references(NotebooksTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get color => text().nullable()();
  RealColumn get sortOrder => real().withDefault(const Constant(0.0))();
  TextColumn get createdAtHlc => text()();
  TextColumn get updatedAtHlc => text()();
  TextColumn get deletedAtHlc => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
