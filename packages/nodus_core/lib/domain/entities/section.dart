import 'package:equatable/equatable.dart';

/// Domain entity representing a Section inside a Notebook.
class Section extends Equatable {
  final String id;
  final String notebookId;
  final String name;
  final String? color;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;

  const Section({
    required this.id,
    required this.notebookId,
    required this.name,
    this.color,
    this.sortOrder = 0.0,
    required this.createdAtHlc,
    required this.updatedAtHlc,
  });

  @override
  List<Object?> get props => [id, notebookId, name, color, sortOrder, createdAtHlc, updatedAtHlc];
}
