import 'package:equatable/equatable.dart';

/// Domain entity representing a task item extracted from an inline block.
class TaskItem extends Equatable {
  final String id;
  final String blockId;
  final String pageId;
  final String title;
  final bool isCompleted;
  final String priority; // low, medium, high, urgent
  final String status;   // todo, in_progress, done, blocked
  final DateTime? dueDate;
  final DateTime? startDate;
  final String? estimate;
  final String? rrule;
  final List<String> tags;
  final String createdAtHlc;
  final String updatedAtHlc;

  const TaskItem({
    required this.id,
    required this.blockId,
    required this.pageId,
    required this.title,
    this.isCompleted = false,
    this.priority = 'medium',
    this.status = 'todo',
    this.dueDate,
    this.startDate,
    this.estimate,
    this.rrule,
    this.tags = const [],
    required this.createdAtHlc,
    required this.updatedAtHlc,
  });

  @override
  List<Object?> get props => [
        id,
        blockId,
        pageId,
        title,
        isCompleted,
        priority,
        status,
        dueDate,
        startDate,
        estimate,
        rrule,
        tags,
        createdAtHlc,
        updatedAtHlc,
      ];
}
