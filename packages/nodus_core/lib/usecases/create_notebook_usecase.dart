import 'package:uuid/uuid.dart';
import '../domain/entities/notebook.dart';
import '../domain/repositories/notes_repository.dart';
import '../domain/utils/hlc.dart';

/// Use case for creating a new Notebook.
class CreateNotebookUseCase {
  final INotesRepository _repository;
  final String nodeId;

  CreateNotebookUseCase(this._repository, {required this.nodeId});

  Future<Notebook> execute({
    required String name,
    String? color,
    String? icon,
    double sortOrder = 0.0,
  }) async {
    final nowHlc = Hlc.now(nodeId: nodeId).encode();
    final notebook = Notebook(
      id: const Uuid().v4(),
      name: name,
      color: color,
      icon: icon,
      sortOrder: sortOrder,
      createdAtHlc: nowHlc,
      updatedAtHlc: nowHlc,
    );

    await _repository.saveNotebook(notebook);
    return notebook;
  }
}
