import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

void main() {
  group('NoteBlock Polymorphic Entities TDD', () {
    test('serializes and deserializes TextBlock to and from JSON', () {
      const block = TextBlock(
        id: 'tb-1',
        pageId: 'p-1',
        sortOrder: 1.0,
        text: 'Hello Nodus with **bold** text',
      );

      final json = block.toJson();
      expect(json['blockType'], equals('text'));
      expect(json['text'], equals('Hello Nodus with **bold** text'));

      final restored = NoteBlock.fromJson(json);
      expect(restored, isA<TextBlock>());
      expect((restored as TextBlock).text, equals(block.text));
    });

    test('serializes and deserializes CodeBlock to and from JSON', () {
      const block = CodeBlock(
        id: 'cb-1',
        pageId: 'p-1',
        sortOrder: 2.0,
        language: 'python',
        source: 'print("Nodus")',
        stripPromptPrefixes: true,
      );

      final json = block.toJson();
      expect(json['blockType'], equals('code'));
      expect(json['language'], equals('python'));

      final restored = NoteBlock.fromJson(json);
      expect(restored, isA<CodeBlock>());
      expect((restored as CodeBlock).source, equals('print("Nodus")'));
    });

    test('serializes and deserializes TerminalBlock to and from JSON', () {
      const block = TerminalBlock(
        id: 'term-1',
        pageId: 'p-1',
        sortOrder: 3.0,
        command: 'curl -v https://api.nodus.local',
        output: '\x1b[32mHTTP/2 200 OK\x1b[0m',
        exitCode: 0,
      );

      final json = block.toJson();
      expect(json['blockType'], equals('terminal'));
      expect(json['exitCode'], equals(0));

      final restored = NoteBlock.fromJson(json);
      expect(restored, isA<TerminalBlock>());
      expect((restored as TerminalBlock).command, equals(block.command));
    });

    test('serializes and deserializes VaultBlock to and from JSON', () {
      const block = VaultBlock(
        id: 'v-1',
        pageId: 'p-1',
        sortOrder: 4.0,
        encryptedPayload: 'ENCRYPTED_BASE64_CIPHERTEXT',
        hint: 'AWS Production Access Key',
      );

      final json = block.toJson();
      expect(json['blockType'], equals('vault'));

      final restored = NoteBlock.fromJson(json);
      expect(restored, isA<VaultBlock>());
      expect((restored as VaultBlock).encryptedPayload, equals(block.encryptedPayload));
    });
  });
}
