/// Core domain, database, CAS, and security engine for Nodus.
library;

// Domain Entities
export 'domain/entities/note_block.dart';
export 'domain/entities/notebook.dart';
export 'domain/entities/section.dart';
export 'domain/entities/note_page.dart';
export 'domain/entities/task_item.dart';

// Domain Commands (Reversible Undo/Redo)
export 'domain/commands/editor_command.dart';
export 'domain/commands/command_history.dart';

// Domain Repositories (Contracts)
export 'domain/repositories/notes_repository.dart';
export 'domain/repositories/blob_repository.dart';

// Domain Utilities
export 'domain/utils/hlc.dart';

// Data - Database, DAOs & CAS
export 'data/database/app_database.dart';
export 'data/database/daos/notes_dao.dart';
export 'data/database/daos/search_dao.dart';
export 'data/cas/blob_manager.dart';
export 'data/repositories/notes_repository_impl.dart';
export 'data/repositories/blob_repository_impl.dart';

// Use Cases
export 'usecases/create_notebook_usecase.dart';
export 'usecases/get_notebook_hierarchy_usecase.dart';
export 'usecases/save_page_blocks_usecase.dart';
export 'usecases/search_notes_fts_usecase.dart';
export 'usecases/detect_secrets_usecase.dart';
export 'usecases/parse_tasks_usecase.dart';
