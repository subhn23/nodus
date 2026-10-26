import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import 'package:nodus_core/nodus_core.dart';

class MockNotesRepository extends Mock implements INotesRepository {}
class MockSearchDao extends Mock implements SearchDao {}

void main() {
  setUpAll(() {
    registerFallbackValue(const Notebook(
      id: 'fallback',
      name: 'Fallback',
      createdAtHlc: '',
      updatedAtHlc: '',
    ));
    registerFallbackValue(const TaskItem(
      id: 'fallback',
      blockId: '',
      pageId: '',
      title: '',
      createdAtHlc: '',
      updatedAtHlc: '',
    ));
  });

  group('Pure Dart Use Cases TDD', () {
    late MockNotesRepository mockRepo;
    late MockSearchDao mockSearchDao;

    setUp(() {
      mockRepo = MockNotesRepository();
      mockSearchDao = MockSearchDao();
    });

    test('CreateNotebookUseCase creates and persists a notebook', () async {
      when(() => mockRepo.saveNotebook(any())).thenAnswer((_) async {});

      final useCase = CreateNotebookUseCase(mockRepo, nodeId: 'test-node');
      final notebook = await useCase.execute(name: 'DevOps & Infrastructure');

      expect(notebook.name, equals('DevOps & Infrastructure'));
      expect(notebook.id.isNotEmpty, isTrue);
      expect(notebook.createdAtHlc.isNotEmpty, isTrue);

      verify(() => mockRepo.saveNotebook(notebook)).called(1);
    });

    test('GetNotebookHierarchyUseCase constructs tree of notebooks, sections, and pages', () async {
      final nb = Notebook(
        id: 'nb-1',
        name: 'Penetration Testing',
        createdAtHlc: '0:0:node',
        updatedAtHlc: '0:0:node',
      );
      final sec = Section(
        id: 'sec-1',
        notebookId: 'nb-1',
        name: 'Web Apps',
        createdAtHlc: '0:0:node',
        updatedAtHlc: '0:0:node',
      );
      final page = NotePage(
        id: 'p-1',
        sectionId: 'sec-1',
        title: 'SQL Injection Exploitation',
        createdAtHlc: '0:0:node',
        updatedAtHlc: '0:0:node',
      );

      when(() => mockRepo.getNotebooks()).thenAnswer((_) async => [nb]);
      when(() => mockRepo.getSections('nb-1')).thenAnswer((_) async => [sec]);
      when(() => mockRepo.getPages('sec-1')).thenAnswer((_) async => [page]);

      final useCase = GetNotebookHierarchyUseCase(mockRepo);
      final tree = await useCase.execute();

      expect(tree.length, equals(1));
      expect(tree.first.notebook.name, equals('Penetration Testing'));
      expect(tree.first.sections.length, equals(1));
      expect(tree.first.sections.first.section.name, equals('Web Apps'));
      expect(tree.first.sections.first.pages.length, equals(1));
      expect(tree.first.sections.first.pages.first.title, equals('SQL Injection Exploitation'));
    });

    test('DetectSecretsUseCase identifies AWS keys, GitHub PATs, and SSH keys', () {
      final blocks = <NoteBlock>[
        const TextBlock(
          id: 'b1',
          pageId: 'p1',
          sortOrder: 1.0,
          text: 'Here is the AWS credentials: AKIAIOSFODNN7EXAMPLE for deployment.',
        ),
        const CodeBlock(
          id: 'b2',
          pageId: 'p1',
          sortOrder: 2.0,
          language: 'bash',
          source: 'export GITHUB_TOKEN=ghp_123456789012345678901234567890123456',
        ),
        const TextBlock(
          id: 'b3',
          pageId: 'p1',
          sortOrder: 3.0,
          text: 'Private key dump:\n-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKCAQEA...\n-----END RSA PRIVATE KEY-----',
        ),
      ];

      final useCase = DetectSecretsUseCase();
      final detections = useCase.execute(blocks);

      expect(detections.length, equals(3));
      expect(detections[0].ruleName, equals('AWS Access Key'));
      expect(detections[0].matchedText, equals('AKIAIOSFODNN7EXAMPLE'));
      expect(detections[0].redactedSuggestion, contains('AKIA...'));

      expect(detections[1].ruleName, equals('GitHub Personal Access Token'));
      expect(detections[2].ruleName, equals('SSH Private Key'));
    });

    test('ParseTasksUseCase extracts inline task attributes', () {
      final blocks = <NoteBlock>[
        const TaskBlock(
          id: 't1',
          pageId: 'p1',
          sortOrder: 1.0,
          rawText: '- [ ] Configure reverse proxy @due(2026-11-01 14:00) @priority(high) @status(in_progress) @estimate(4h) #infra #nginx',
        ),
        const TaskBlock(
          id: 't2',
          pageId: 'p1',
          sortOrder: 2.0,
          rawText: '- [x] Write unit tests for router',
        ),
      ];

      final useCase = ParseTasksUseCase(nodeId: 'test-node');
      final tasks = useCase.execute(pageId: 'p1', blocks: blocks);

      expect(tasks.length, equals(2));

      // Task 1
      expect(tasks[0].title, equals('Configure reverse proxy'));
      expect(tasks[0].isCompleted, isFalse);
      expect(tasks[0].priority, equals('high'));
      expect(tasks[0].status, equals('in_progress'));
      expect(tasks[0].estimate, equals('4h'));
      expect(tasks[0].dueDate, equals(DateTime(2026, 11, 1, 14, 0)));
      expect(tasks[0].tags, containsAll(['infra', 'nginx']));

      // Task 2
      expect(tasks[1].title, equals('Write unit tests for router'));
      expect(tasks[1].isCompleted, isTrue);
      expect(tasks[1].status, equals('done'));
    });

    test('SavePageBlocksUseCase coordinates DB save, FTS index, task parsing, and secret detection', () async {
      when(() => mockRepo.saveBlocks(any())).thenAnswer((_) async {});
      when(() => mockRepo.saveTask(any())).thenAnswer((_) async {});
      when(() => mockSearchDao.indexPage(
            pageId: any(named: 'pageId'),
            title: any(named: 'title'),
            bodyText: any(named: 'bodyText'),
            tags: any(named: 'tags'),
            codeSnippets: any(named: 'codeSnippets'),
          )).thenAnswer((_) async {});

      final useCase = SavePageBlocksUseCase(
        notesRepository: mockRepo,
        searchDao: mockSearchDao,
        detectSecretsUseCase: DetectSecretsUseCase(),
        parseTasksUseCase: ParseTasksUseCase(nodeId: 'node-1'),
      );

      final blocks = <NoteBlock>[
        const HeadingBlock(id: 'b1', pageId: 'p1', sortOrder: 1.0, text: 'Network Audit'),
        const TaskBlock(id: 'b2', pageId: 'p1', sortOrder: 2.0, rawText: '- [ ] Scan subnet @priority(urgent)'),
        const CodeBlock(id: 'b3', pageId: 'p1', sortOrder: 3.0, source: 'AKIAIOSFODNN7EXAMPLE'),
      ];

      final result = await useCase.execute(
        pageId: 'p1',
        pageTitle: 'Network Audit Report',
        blocks: blocks,
      );

      expect(result.tasksCount, equals(1));
      expect(result.secretDetections.length, equals(1));
      expect(result.secretDetections.first.ruleName, equals('AWS Access Key'));

      verify(() => mockRepo.saveBlocks(blocks)).called(1);
      verify(() => mockSearchDao.indexPage(
            pageId: 'p1',
            title: 'Network Audit Report',
            bodyText: any(named: 'bodyText'),
            tags: any(named: 'tags'),
            codeSnippets: any(named: 'codeSnippets'),
          )).called(1);
      verify(() => mockRepo.saveTask(any())).called(1);
    });
  });
}
