import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

class TestBlock extends NoteBlockEntity {
  const TestBlock({
    required super.id,
    required super.pageId,
    required super.sortOrder,
  });
}

void main() {
  group('NoteBlockEntity', () {
    test('instantiates with expected properties', () {
      const block = TestBlock(
        id: 'block-1',
        pageId: 'page-1',
        sortOrder: 1.0,
      );

      expect(block.id, equals('block-1'));
      expect(block.pageId, equals('page-1'));
      expect(block.sortOrder, equals(1.0));
    });
  });
}
