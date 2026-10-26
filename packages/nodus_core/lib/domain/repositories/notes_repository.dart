import '../entities/notebook.dart';
import '../entities/section.dart';
import '../entities/note_page.dart';
import '../entities/note_block.dart';
import '../entities/task_item.dart';

/// Contract for notes, hierarchy, blocks, and tasks storage.
abstract class INotesRepository {
  // Notebooks
  Future<List<Notebook>> getNotebooks();
  Future<void> saveNotebook(Notebook notebook);
  Future<void> deleteNotebook(String id, String deletedAtHlc);

  // Sections
  Future<List<Section>> getSections(String notebookId);
  Future<void> saveSection(Section section);
  Future<void> deleteSection(String id, String deletedAtHlc);

  // Pages
  Future<List<NotePage>> getPages(String sectionId);
  Future<NotePage?> getPage(String id);
  Future<void> savePage(NotePage page);
  Future<void> deletePage(String id, String deletedAtHlc);

  // Blocks
  Future<List<NoteBlock>> getBlocks(String pageId);
  Future<void> saveBlocks(List<NoteBlock> blocks);
  Future<void> deleteBlock(String id, String deletedAtHlc);

  // Tasks
  Future<List<TaskItem>> getTasksForPage(String pageId);
  Future<List<TaskItem>> getActiveTasks();
  Future<void> saveTask(TaskItem task);
  Future<void> setTaskCompleted(String id, bool isCompleted);
}
