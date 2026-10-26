import 'package:drift/drift.dart';
import 'note_blocks_table.dart';
import 'pages_table.dart';

/// Relational table definition for tasks extracted from note blocks.
class TasksTable extends Table {
  @override
  String get tableName => 'tasks';

  TextColumn get id => text()();
  TextColumn get blockId => text().references(NoteBlocksTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get pageId => text().references(PagesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get title => text()();
  BoolColumn get isCompleted => boolean().withDefault(const Constant(false))();
  TextColumn get priority => text().withDefault(const Constant('medium'))();
  TextColumn get status => text().withDefault(const Constant('todo'))();
  DateTimeColumn get dueDate => dateTime().nullable()();
  DateTimeColumn get startDate => dateTime().nullable()();
  TextColumn get estimate => text().nullable()();
  TextColumn get rrule => text().nullable()();
  TextColumn get tags => text().nullable()();
  TextColumn get createdAtHlc => text()();
  TextColumn get updatedAtHlc => text()();

  @override
  Set<Column> get primaryKey => {id};
}
