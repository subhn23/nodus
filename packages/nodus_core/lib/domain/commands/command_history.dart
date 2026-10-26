import '../entities/note_block.dart';
import 'editor_command.dart';

/// Manages linear per-page undo and redo stacks for the block editor.
class CommandHistory {
  final List<EditorCommand> _undoStack = [];
  final List<EditorCommand> _redoStack = [];
  final int maxHistorySize;

  CommandHistory({this.maxHistorySize = 100});

  /// Whether an undo operation is currently available.
  bool get canUndo => _undoStack.isNotEmpty;

  /// Whether a redo operation is currently available.
  bool get canRedo => _redoStack.isNotEmpty;

  /// Executes [command], clears the redo stack, and pushes the command to the undo stack.
  List<NoteBlock> execute(EditorCommand command, List<NoteBlock> currentBlocks) {
    _redoStack.clear();
    _undoStack.add(command);
    if (_undoStack.length > maxHistorySize) {
      _undoStack.removeAt(0);
    }
    return command.execute(currentBlocks);
  }

  /// Reverts the most recent command on the undo stack.
  List<NoteBlock> undo(List<NoteBlock> currentBlocks) {
    if (!canUndo) return currentBlocks;
    final command = _undoStack.removeLast();
    _redoStack.add(command);
    return command.undo(currentBlocks);
  }

  /// Reapplies the most recent undone command on the redo stack.
  List<NoteBlock> redo(List<NoteBlock> currentBlocks) {
    if (!canRedo) return currentBlocks;
    final command = _redoStack.removeLast();
    _undoStack.add(command);
    return command.execute(currentBlocks);
  }

  /// Clears both undo and redo stacks.
  void clear() {
    _undoStack.clear();
    _redoStack.clear();
  }
}
