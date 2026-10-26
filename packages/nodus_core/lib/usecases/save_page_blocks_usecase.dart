import '../data/database/daos/search_dao.dart';
import '../domain/entities/note_block.dart';
import '../domain/repositories/notes_repository.dart';
import 'detect_secrets_usecase.dart';
import 'parse_tasks_usecase.dart';

/// Result object returned by [SavePageBlocksUseCase].
class SaveBlocksResult {
  final List<SecretDetection> secretDetections;
  final int tasksCount;

  const SaveBlocksResult({
    required this.secretDetections,
    required this.tasksCount,
  });
}

/// Orchestrates atomic page persistence, FTS5 search indexing,
/// dual-write task parsing, and SecretGuard inspection.
class SavePageBlocksUseCase {
  final INotesRepository notesRepository;
  final SearchDao searchDao;
  final DetectSecretsUseCase detectSecretsUseCase;
  final ParseTasksUseCase parseTasksUseCase;

  SavePageBlocksUseCase({
    required this.notesRepository,
    required this.searchDao,
    required this.detectSecretsUseCase,
    required this.parseTasksUseCase,
  });

  Future<SaveBlocksResult> execute({
    required String pageId,
    required String pageTitle,
    required List<NoteBlock> blocks,
  }) async {
    // 1. Batch save blocks to relational database
    await notesRepository.saveBlocks(blocks);

    // 2. Denormalize text for sub-millisecond FTS5 search
    final bodyBuffer = StringBuffer();
    final codeBuffer = StringBuffer();
    final tagsBuffer = StringBuffer();

    for (final block in blocks) {
      switch (block) {
        case TextBlock(:final text):
          bodyBuffer.writeln(text);
        case HeadingBlock(:final text):
          bodyBuffer.writeln(text);
        case CodeBlock(:final source):
          codeBuffer.writeln(source);
        case TerminalBlock(:final command, :final output):
          codeBuffer.writeln('$command\n$output');
        case TaskBlock(:final rawText):
          bodyBuffer.writeln(rawText);
        case ImageBlock(:final altText):
          if (altText.isNotEmpty) bodyBuffer.writeln(altText);
        case VaultBlock():
          // Vault secrets are air-gapped and excluded from FTS5 index
          break;
      }
    }

    await searchDao.indexPage(
      pageId: pageId,
      title: pageTitle,
      bodyText: bodyBuffer.toString(),
      tags: tagsBuffer.toString(),
      codeSnippets: codeBuffer.toString(),
    );

    // 3. Extract tasks and synchronize relational tasks table
    final tasks = parseTasksUseCase.execute(pageId: pageId, blocks: blocks);
    for (final task in tasks) {
      await notesRepository.saveTask(task);
    }

    // 4. Run SecretGuard inspection on saved blocks
    final secrets = detectSecretsUseCase.execute(blocks);

    return SaveBlocksResult(
      secretDetections: secrets,
      tasksCount: tasks.length,
    );
  }
}
