import 'package:drift/drift.dart';

/// Relational metadata table for Content-Addressable Storage (CAS) blobs.
class BlobsTable extends Table {
  @override
  String get tableName => 'blobs';

  TextColumn get hash => text()();
  IntColumn get byteSize => integer()();
  TextColumn get mimeType => text().nullable()();
  TextColumn get originalName => text().nullable()();
  IntColumn get referenceCount => integer().withDefault(const Constant(1))();
  DateTimeColumn get createdAt => dateTime().withDefault(currentDateAndTime)();

  @override
  Set<Column> get primaryKey => {hash};
}
