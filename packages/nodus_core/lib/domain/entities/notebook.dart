import 'package:equatable/equatable.dart';

/// Domain entity representing a top-level Notebook.
class Notebook extends Equatable {
  final String id;
  final String name;
  final String? color;
  final String? icon;
  final double sortOrder;
  final String createdAtHlc;
  final String updatedAtHlc;

  const Notebook({
    required this.id,
    required this.name,
    this.color,
    this.icon,
    this.sortOrder = 0.0,
    required this.createdAtHlc,
    required this.updatedAtHlc,
  });

  @override
  List<Object?> get props => [id, name, color, icon, sortOrder, createdAtHlc, updatedAtHlc];
}
