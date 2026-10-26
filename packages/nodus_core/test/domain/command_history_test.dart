import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

void main() {
  group('CommandHistory & EditorCommands TDD', () {
    late CommandHistory history;
    late List<NoteBlock> blocks;

    setUp(() {
      history = CommandHistory();
      blocks = [
        const HeadingBlock(id: 'b1', pageId: 'p1', sortOrder: 1.0, text: 'Title'),
        const TextBlock(id: 'b2', pageId: 'p1', sortOrder: 2.0, text: 'Initial body text'),
      ];
    });

    test('executes EditBlockCommand and supports undo and redo', () {
      final initialBlock = blocks[1] as TextBlock;
      final updatedBlock = initialBlock.copyWith(text: 'Updated body text');

      // 1. Execute edit
      blocks = history.execute(
        EditBlockCommand(previousBlock: initialBlock, updatedBlock: updatedBlock),
        blocks,
      );

      expect((blocks[1] as TextBlock).text, equals('Updated body text'));
      expect(history.canUndo, isTrue);
      expect(history.canRedo, isFalse);

      // 2. Undo edit
      blocks = history.undo(blocks);
      expect((blocks[1] as TextBlock).text, equals('Initial body text'));
      expect(history.canUndo, isFalse);
      expect(history.canRedo, isTrue);

      // 3. Redo edit
      blocks = history.redo(blocks);
      expect((blocks[1] as TextBlock).text, equals('Updated body text'));
      expect(history.canUndo, isTrue);
      expect(history.canRedo, isFalse);
    });

    test('executes InsertBlockCommand and DeleteBlockCommand with reversible state', () {
      const newBlock = CodeBlock(id: 'b3', pageId: 'p1', sortOrder: 3.0, source: 'echo hello');

      // 1. Insert
      blocks = history.execute(
        InsertBlockCommand(index: 2, block: newBlock),
        blocks,
      );
      expect(blocks.length, equals(3));
      expect(blocks[2].id, equals('b3'));

      // 2. Delete
      blocks = history.execute(
        DeleteBlockCommand(index: 2, deletedBlock: newBlock),
        blocks,
      );
      expect(blocks.length, equals(2));

      // 3. Undo delete (restores block)
      blocks = history.undo(blocks);
      expect(blocks.length, equals(3));
      expect(blocks[2].id, equals('b3'));

      // 4. Undo insert (removes block)
      blocks = history.undo(blocks);
      expect(blocks.length, equals(2));
      expect(blocks.any((b) => b.id == 'b3'), isFalse);
    });

    test('executes MoveBlockCommand reordering blocks', () {
      // blocks: [b1, b2] -> move b1 to index 1
      blocks = history.execute(
        const MoveBlockCommand(oldIndex: 0, newIndex: 1),
        blocks,
      );
      expect(blocks[0].id, equals('b2'));
      expect(blocks[1].id, equals('b1'));

      // Undo move
      blocks = history.undo(blocks);
      expect(blocks[0].id, equals('b1'));
      expect(blocks[1].id, equals('b2'));
    });
  });
}
