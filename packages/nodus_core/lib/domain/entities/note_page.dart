import 'package:equatable/equatable.dart';

/// Domain entity representing a Page inside a Section.
class NotePage extends Equatable {
  final String id;
  final String sectionId;
  final String title;
  final bool isPinned;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;

  const NotePage({
    required this.id,
    required this.sectionId,
    required this.title,
    this.isPinned = false,
    this.sortOrder = 0.0,
    required this.createdAtHlc,
    required this.updatedAtHlc,
  });

  @override
  List<Object?> get props => [id, sectionId, title, isPinned, sortOrder, createdAtHlc, updatedAtHlc];
}
