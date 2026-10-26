import 'package:drift/drift.dart';
import 'sections_table.dart';

/// Relational table definition for Pages belonging to Sections.
class PagesTable extends Table {
  @override
  String get tableName => 'pages';

  TextColumn get id => text()();
  TextColumn get sectionId => text().references(SectionsTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text().withLength(min: 1, max: 500)();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
  RealColumn get sortOrder => real().withDefault(const Constant(0.0))();
  TextColumn get createdAtHlc => text()();
  TextColumn get updatedAtHlc => text()();
  TextColumn get deletedAtHlc => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
