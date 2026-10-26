import 'package:drift/drift.dart';
import 'pages_table.dart';

/// Relational table definition for polymorphic NoteBlocks belonging to Pages.
/// Contains crdtState and HLC timestamps for zero-compromise CRDT synchronization.
class NoteBlocksTable extends Table {
  @override
  String get tableName => 'note_blocks';

  TextColumn get id => text()();
  TextColumn get pageId => text().references(PagesTable, #id, onDelete: KeyAction.cascade)();
  TextColumn get blockType => text()(); // heading, text, code, terminal, image, task, diagram, vault
  RealColumn get sortOrder => real().withDefault(const Constant(0.0))();
  TextColumn get content => text()(); // JSON payload
  BlobColumn get crdtState => blob().nullable()(); // reserved for sequence CRDT deltas
  TextColumn get createdAtHlc => text()();
  TextColumn get updatedAtHlc => text()();
  TextColumn get deletedAtHlc => text().nullable()();

  @override
  Set<Column> get primaryKey => {id};
}
