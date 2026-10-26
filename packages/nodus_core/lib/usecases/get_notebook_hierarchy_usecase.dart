import '../domain/entities/notebook.dart';
import '../domain/entities/section.dart';
import '../domain/entities/note_page.dart';
import '../domain/repositories/notes_repository.dart';

/// Hierarchy structure for Sections with their respective Pages.
class SectionNode {
  final Section section;
  final List<NotePage> pages;

  const SectionNode({required this.section, required this.pages});
}

/// Hierarchy structure for a Notebook containing Sections and Pages.
class NotebookNode {
  final Notebook notebook;
  final List<SectionNode> sections;

  const NotebookNode({required this.notebook, required this.sections});
}

/// Use case retrieving the entire workspace tree structure.
class GetNotebookHierarchyUseCase {
  final INotesRepository _repository;

  GetNotebookHierarchyUseCase(this._repository);

  Future<List<NotebookNode>> execute() async {
    final notebooks = await _repository.getNotebooks();
    final tree = <NotebookNode>[];

    for (final nb in notebooks) {
      final sections = await _repository.getSections(nb.id);
      final sectionNodes = <SectionNode>[];

      for (final sec in sections) {
        final pages = await _repository.getPages(sec.id);
        sectionNodes.add(SectionNode(section: sec, pages: pages));
      }

      tree.add(NotebookNode(notebook: nb, sections: sectionNodes));
    }

    return tree;
  }
}
