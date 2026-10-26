import 'package:uuid/uuid.dart';
import '../domain/entities/task_item.dart';
import '../domain/entities/note_block.dart';
import '../domain/utils/hlc.dart';

/// Parses inline markdown task blocks into structured [TaskItem] domain entities.
class ParseTasksUseCase {
  final String nodeId;

  ParseTasksUseCase({required this.nodeId});

  static final _taskLineRegex = RegExp(r'^\s*-\s*\[([ xX])\]\s*(.*)$');
  static final _dueRegex = RegExp(r'@due\(([^)]+)\)');
  static final _priorityRegex = RegExp(r'@priority\((low|med|medium|high|urgent)\)');
  static final _statusRegex = RegExp(r'@status\((todo|in_progress|done|blocked)\)');
  static final _startRegex = RegExp(r'@start\(([^)]+)\)');
  static final _estimateRegex = RegExp(r'@estimate\(([^)]+)\)');
  static final _recurRegex = RegExp(r'@recur\(([^)]+)\)');
  static final _tagRegex = RegExp(r'#([a-zA-Z0-9_\-]+)');

  /// Parses all task blocks on a page, generating [TaskItem] records.
  List<TaskItem> execute({
    required String pageId,
    required List<NoteBlock> blocks,
  }) {
    final tasks = <TaskItem>[];
    final nowHlc = Hlc.now(nodeId: nodeId).encode();

    for (final block in blocks) {
      if (block is! TaskBlock) continue;

      final match = _taskLineRegex.firstMatch(block.rawText);
      final rawLine = match != null ? match.group(2)! : block.rawText;
      final isCompleted = match != null && match.group(1)!.trim().toLowerCase() == 'x';

      // 1. Extract @due(...)
      DateTime? dueDate;
      final dueMatch = _dueRegex.firstMatch(rawLine);
      if (dueMatch != null) {
        dueDate = DateTime.tryParse(dueMatch.group(1)!.trim());
      }

      // 2. Extract @start(...)
      DateTime? startDate;
      final startMatch = _startRegex.firstMatch(rawLine);
      if (startMatch != null) {
        startDate = DateTime.tryParse(startMatch.group(1)!.trim());
      }

      // 3. Extract @priority(...)
      String priority = 'medium';
      final priorityMatch = _priorityRegex.firstMatch(rawLine);
      if (priorityMatch != null) {
        final p = priorityMatch.group(1)!.toLowerCase();
        priority = p == 'med' ? 'medium' : p;
      }

      // 4. Extract @status(...)
      String status = isCompleted ? 'done' : 'todo';
      final statusMatch = _statusRegex.firstMatch(rawLine);
      if (statusMatch != null) {
        status = statusMatch.group(1)!.toLowerCase();
      }

      // 5. Extract @estimate(...)
      String? estimate;
      final estMatch = _estimateRegex.firstMatch(rawLine);
      if (estMatch != null) {
        estimate = estMatch.group(1)!.trim();
      }

      // 6. Extract @recur(...)
      String? rrule;
      final recurMatch = _recurRegex.firstMatch(rawLine);
      if (recurMatch != null) {
        rrule = recurMatch.group(1)!.trim();
      }

      // 7. Extract #tags
      final tags = _tagRegex.allMatches(rawLine).map((m) => m.group(1)!).toList();

      // Clean Title: strip metadata attributes from raw line for clean display
      var cleanTitle = rawLine
          .replaceAll(_dueRegex, '')
          .replaceAll(_priorityRegex, '')
          .replaceAll(_statusRegex, '')
          .replaceAll(_startRegex, '')
          .replaceAll(_estimateRegex, '')
          .replaceAll(_recurRegex, '')
          .replaceAll(_tagRegex, '')
          .trim();

      if (cleanTitle.isEmpty) {
        cleanTitle = 'Untitled Task';
      }

      tasks.add(TaskItem(
        id: const Uuid().v4(),
        blockId: block.id,
        pageId: pageId,
        title: cleanTitle,
        isCompleted: isCompleted,
        priority: priority,
        status: status,
        dueDate: dueDate,
        startDate: startDate,
        estimate: estimate,
        rrule: rrule,
        tags: tags,
        createdAtHlc: nowHlc,
        updatedAtHlc: nowHlc,
      ));
    }

    return tasks;
  }
}
