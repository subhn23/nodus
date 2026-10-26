/// Placeholder for NoteBlock entity definitions.
abstract class NoteBlockEntity {
  final String id;
  final String pageId;
  final double sortOrder;

  const NoteBlockEntity({
    required this.id,
    required this.pageId,
    required this.sortOrder,
  });
}
