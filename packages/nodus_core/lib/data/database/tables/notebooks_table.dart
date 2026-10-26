import 'package:drift/drift.dart';

/// Relational table definition for Notebooks.
class NotebooksTable extends Table {
  @override
  String get tableName => 'notebooks';

  TextColumn get id => text()();
  TextColumn get name => text().withLength(min: 1, max: 255)();
  TextColumn get color => text().nullable()();
  TextColumn get icon => text().nullable()();
  RealColumn get sortOrder => real().withDefault(const Constant(0.0))();
  TextColumn get createdAtHlc => text()();
  TextColumn get updatedAtHlc => text()();
  TextColumn get deletedAtHlc => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
