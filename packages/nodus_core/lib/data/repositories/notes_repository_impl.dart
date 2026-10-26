import 'dart:convert';
import 'package:drift/drift.dart';
import '../../domain/entities/notebook.dart';
import '../../domain/entities/section.dart';
import '../../domain/entities/note_page.dart';
import '../../domain/entities/note_block.dart';
import '../../domain/entities/task_item.dart';
import '../../domain/repositories/notes_repository.dart';
import '../database/app_database.dart';
import '../database/daos/notes_dao.dart';

/// Concrete implementation of [INotesRepository] using Drift [NotesDao].
class NotesRepositoryImpl implements INotesRepository {
  final NotesDao _dao;

  NotesRepositoryImpl(this._dao);

  // ---------------------------------------------------------------------------
  // Notebooks
  // ---------------------------------------------------------------------------
  @override
  Future<List<Notebook>> getNotebooks() async {
    final rows = await _dao.getAllNotebooks();
    return rows.map((r) => Notebook(
      id: r.id,
      name: r.name,
      color: r.color,
      icon: r.icon,
      sortOrder: r.sortOrder,
      createdAtHlc: r.createdAtHlc,
      updatedAtHlc: r.updatedAtHlc,
    )).toList();
  }

  @override
  Future<void> saveNotebook(Notebook notebook) {
    return _dao.upsertNotebook(NotebooksTableCompanion(
      id: Value(notebook.id),
      name: Value(notebook.name),
      color: Value(notebook.color),
      icon: Value(notebook.icon),
      sortOrder: Value(notebook.sortOrder),
      createdAtHlc: Value(notebook.createdAtHlc),
      updatedAtHlc: Value(notebook.updatedAtHlc),
    ));
  }

  @override
  Future<void> deleteNotebook(String id, String deletedAtHlc) {
    return _dao.softDeleteNotebook(id, deletedAtHlc);
  }

  // ---------------------------------------------------------------------------
  // Sections
  // ---------------------------------------------------------------------------
  @override
  Future<List<Section>> getSections(String notebookId) async {
    final rows = await _dao.getSectionsForNotebook(notebookId);
    return rows.map((r) => Section(
      id: r.id,
      notebookId: r.notebookId,
      name: r.name,
      color: r.color,
      sortOrder: r.sortOrder,
      createdAtHlc: r.createdAtHlc,
      updatedAtHlc: r.updatedAtHlc,
    )).toList();
  }

  @override
  Future<void> saveSection(Section section) {
    return _dao.upsertSection(SectionsTableCompanion(
      id: Value(section.id),
      notebookId: Value(section.notebookId),
      name: Value(section.name),
      color: Value(section.color),
      sortOrder: Value(section.sortOrder),
      createdAtHlc: Value(section.createdAtHlc),
      updatedAtHlc: Value(section.updatedAtHlc),
    ));
  }

  @override
  Future<void> deleteSection(String id, String deletedAtHlc) {
    return _dao.softDeleteSection(id, deletedAtHlc);
  }

  // ---------------------------------------------------------------------------
  // Pages
  // ---------------------------------------------------------------------------
  @override
  Future<List<NotePage>> getPages(String sectionId) async {
    final rows = await _dao.getPagesForSection(sectionId);
    return rows.map((r) => NotePage(
      id: r.id,
      sectionId: r.sectionId,
      title: r.title,
      isPinned: r.isPinned,
      sortOrder: r.sortOrder,
      createdAtHlc: r.createdAtHlc,
      updatedAtHlc: r.updatedAtHlc,
    )).toList();
  }

  @override
  Future<NotePage?> getPage(String id) async {
    final r = await _dao.getPageById(id);
    if (r == null) return null;
    return NotePage(
      id: r.id,
      sectionId: r.sectionId,
      title: r.title,
      isPinned: r.isPinned,
      sortOrder: r.sortOrder,
      createdAtHlc: r.createdAtHlc,
      updatedAtHlc: r.updatedAtHlc,
    );
  }

  @override
  Future<void> savePage(NotePage page) {
    return _dao.upsertPage(PagesTableCompanion(
      id: Value(page.id),
      sectionId: Value(page.sectionId),
      title: Value(page.title),
      isPinned: Value(page.isPinned),
      sortOrder: Value(page.sortOrder),
      createdAtHlc: Value(page.createdAtHlc),
      updatedAtHlc: Value(page.updatedAtHlc),
    ));
  }

  @override
  Future<void> deletePage(String id, String deletedAtHlc) {
    return _dao.softDeletePage(id, deletedAtHlc);
  }

  // ---------------------------------------------------------------------------
  // Blocks
  // ---------------------------------------------------------------------------
  @override
  Future<List<NoteBlock>> getBlocks(String pageId) async {
    final rows = await _dao.getBlocksForPage(pageId);
    return rows.map((r) {
      final jsonMap = jsonDecode(r.content) as Map<String, dynamic>;
      // Ensure ID, pageId, sortOrder, and crdtState match the row
      jsonMap['id'] = r.id;
      jsonMap['pageId'] = r.pageId;
      jsonMap['sortOrder'] = r.sortOrder;
      jsonMap['blockType'] = r.blockType;
      if (r.crdtState != null) {
        jsonMap['crdtStateBase64'] = base64Encode(r.crdtState!);
      }
      return NoteBlock.fromJson(jsonMap);
    }).toList();
  }

  @override
  Future<void> saveBlocks(List<NoteBlock> blocks) {
    final companions = blocks.map((b) {
      final jsonMap = b.toJson();
      final contentStr = jsonEncode(jsonMap);
      Uint8List? crdtBytes;
      if (b.crdtStateBase64 != null) {
        crdtBytes = base64Decode(b.crdtStateBase64!);
      }

      return NoteBlocksTableCompanion(
        id: Value(b.id),
        pageId: Value(b.pageId),
        blockType: Value(b.blockType),
        sortOrder: Value(b.sortOrder),
        content: Value(contentStr),
        crdtState: Value(crdtBytes),
        createdAtHlc: const Value(''),
        updatedAtHlc: const Value(''),
      );
    }).toList();

    return _dao.batchSaveBlocks(companions);
  }

  @override
  Future<void> deleteBlock(String id, String deletedAtHlc) {
    return _dao.softDeleteBlock(id, deletedAtHlc);
  }

  // ---------------------------------------------------------------------------
  // Tasks
  // ---------------------------------------------------------------------------
  @override
  Future<List<TaskItem>> getTasksForPage(String pageId) async {
    final rows = await _dao.getTasksForPage(pageId);
    return rows.map(_mapTaskRow).toList();
  }

  @override
  Future<List<TaskItem>> getActiveTasks() async {
    final rows = await _dao.getAllActiveTasks();
    return rows.map(_mapTaskRow).toList();
  }

  @override
  Future<void> saveTask(TaskItem task) {
    return _dao.upsertTask(TasksTableCompanion(
      id: Value(task.id),
      blockId: Value(task.blockId),
      pageId: Value(task.pageId),
      title: Value(task.title),
      isCompleted: Value(task.isCompleted),
      priority: Value(task.priority),
      status: Value(task.status),
      dueDate: Value(task.dueDate),
      startDate: Value(task.startDate),
      estimate: Value(task.estimate),
      rrule: Value(task.rrule),
      tags: Value(task.tags.isEmpty ? null : task.tags.join(',')),
      createdAtHlc: Value(task.createdAtHlc),
      updatedAtHlc: Value(task.updatedAtHlc),
    ));
  }

  @override
  Future<void> setTaskCompleted(String id, bool isCompleted) {
    return _dao.setTaskCompleted(id, isCompleted);
  }

  TaskItem _mapTaskRow(TasksTableData r) {
    final tagList = r.tags == null || r.tags!.isEmpty
        ? <String>[]
        : r.tags!.split(',').map((t) => t.trim()).toList();

    return TaskItem(
      id: r.id,
      blockId: r.blockId,
      pageId: r.pageId,
      title: r.title,
      isCompleted: r.isCompleted,
      priority: r.priority,
      status: r.status,
      dueDate: r.dueDate,
      startDate: r.startDate,
      estimate: r.estimate,
      rrule: r.rrule,
      tags: tagList,
      createdAtHlc: r.createdAtHlc,
      updatedAtHlc: r.updatedAtHlc,
    );
  }
}
