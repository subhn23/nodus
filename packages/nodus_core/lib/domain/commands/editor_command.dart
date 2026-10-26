import '../entities/note_block.dart';

/// Base interface for all reversible editor commands.
abstract class EditorCommand {
  /// Executes the command on [blocks], returning the modified list of blocks.
  List<NoteBlock> execute(List<NoteBlock> blocks);

  /// Reverses the command on [blocks], returning the restored list of blocks.
  List<NoteBlock> undo(List<NoteBlock> blocks);
}

/// Command for editing or modifying an existing block's content.
class EditBlockCommand implements EditorCommand {
  final NoteBlock previousBlock;
  final NoteBlock updatedBlock;

  const EditBlockCommand({
    required this.previousBlock,
    required this.updatedBlock,
  });

  @override
  List<NoteBlock> execute(List<NoteBlock> blocks) {
    return blocks.map((b) => b.id == updatedBlock.id ? updatedBlock : b).toList();
  }

  @override
  List<NoteBlock> undo(List<NoteBlock> blocks) {
    return blocks.map((b) => b.id == previousBlock.id ? previousBlock : b).toList();
  }
}

/// Command for inserting a new block at a specified index.
class InsertBlockCommand implements EditorCommand {
  final int index;
  final NoteBlock block;

  const InsertBlockCommand({
    required this.index,
    required this.block,
  });

  @override
  List<NoteBlock> execute(List<NoteBlock> blocks) {
    final list = List<NoteBlock>.from(blocks);
    final clampedIndex = index.clamp(0, list.length);
    list.insert(clampedIndex, block);
    return list;
  }

  @override
  List<NoteBlock> undo(List<NoteBlock> blocks) {
    final list = List<NoteBlock>.from(blocks);
    list.removeWhere((b) => b.id == block.id);
    return list;
  }
}

/// Command for deleting an existing block (preserves deleted block for undo).
class DeleteBlockCommand implements EditorCommand {
  final int index;
  final NoteBlock deletedBlock;

  const DeleteBlockCommand({
    required this.index,
    required this.deletedBlock,
  });

  @override
  List<NoteBlock> execute(List<NoteBlock> blocks) {
    final list = List<NoteBlock>.from(blocks);
    list.removeWhere((b) => b.id == deletedBlock.id);
    return list;
  }

  @override
  List<NoteBlock> undo(List<NoteBlock> blocks) {
    final list = List<NoteBlock>.from(blocks);
    final clampedIndex = index.clamp(0, list.length);
    list.insert(clampedIndex, deletedBlock);
    return list;
  }
}

/// Command for reordering a block from [oldIndex] to [newIndex].
class MoveBlockCommand implements EditorCommand {
  final int oldIndex;
  final int newIndex;

  const MoveBlockCommand({
    required this.oldIndex,
    required this.newIndex,
  });

  @override
  List<NoteBlock> execute(List<NoteBlock> blocks) {
    if (oldIndex < 0 || oldIndex >= blocks.length || newIndex < 0 || newIndex >= blocks.length) {
      return blocks;
    }
    final list = List<NoteBlock>.from(blocks);
    final item = list.removeAt(oldIndex);
    list.insert(newIndex, item);
    return list;
  }

  @override
  List<NoteBlock> undo(List<NoteBlock> blocks) {
    if (oldIndex < 0 || oldIndex >= blocks.length || newIndex < 0 || newIndex >= blocks.length) {
      return blocks;
    }
    final list = List<NoteBlock>.from(blocks);
    final item = list.removeAt(newIndex);
    list.insert(oldIndex, item);
    return list;
  }
}
