# 📋 Nodus Master Project TODO

> **Documentation Standard:**  
> All architectural notes, plans, research, and documentation must **always** reside within the organized [`docs/`](./docs) folder in the project root.

---

## 📊 Overall Progress Summary

- [ ] **Phase 1: Core Foundation & Custom Block Editor MVP** (1 / 9 Milestones Completed)
- [ ] **Phase 2: Standalone MCP Server CLI, Kanban, Gantt & Export Suite** (0 / 5 Milestones Completed)
- [ ] **Phase 3: Decentralized P2P Sync & Zero-Knowledge Cloud Backup** (0 / 3 Milestones Completed)
- [ ] **Phase 4: Desktop Enhancements & Mobile Production Hardening** (0 / 3 Milestones Completed)

---

## 🎯 Phase 1: Core Foundation & Custom Block Editor MVP

### Milestone 1: Dart Workspace Monorepo Scaffolding & Dependencies
- [x] **1.1 Monorepo Workspace Configuration**
  - [x] Configure root `pubspec.yaml` with Dart workspace resolution for `packages/nodus_core` and `packages/nodus_mcp`.
  - [x] Create `packages/nodus_core` package directory and initialize pure Dart `pubspec.yaml`.
  - [x] Create `packages/nodus_mcp` package directory and initialize CLI executable `pubspec.yaml`.
- [x] **1.2 Core Dependency Graph**
  - [x] Add `drift`, `sqlite3`, `crypto`, `equatable`, `freezed_annotation`, `json_annotation`, `uuid` to `packages/nodus_core`.
  - [x] Add `build_runner`, `drift_dev`, `freezed`, `json_serializable` to `nodus_core` dev dependencies.
  - [x] Add `flutter_bloc`, `bloc`, `get_it`, `window_manager`, `multi_split_view`, `google_fonts`, `flutter_svg`, `flutter_secure_storage`, `image` to root Flutter `pubspec.yaml`.
  - [x] Add `bloc_test`, `mocktail`, `flutter_test`, `integration_test` to root dev dependencies.
- [x] **1.3 Clean Architecture Folder Structure**
  - [x] Setup `packages/nodus_core/lib/{domain,data,usecases}` structure.
  - [x] Setup `lib/core/{di,theme,window,error,utils}` in root app.
  - [x] Setup `lib/features/{notes,editor,storage_dash,security,tasks}` in root app.
- [x] **1.4 Verification**
  - [x] Run `flutter pub get` and verify dependency graph resolves without version conflicts on Dart 3.13 / Flutter 3.47+.
  - [x] Verify `nodus_core` can compile in pure Dart without any Flutter SDK imports.

---

### Milestone 2: "Carbon HUD" Theme Engine, Window Management & Golden Tests
- [ ] **2.1 High-Density HUD Theme Extension**
  - [ ] Implement `CarbonHUDTheme` extending Flutter's `ThemeExtension`.
  - [ ] Define core palette tokens: `background`, `surface`, `surfaceElevated`, `accent`, `textPrimary`, `textSecondary`, `border`, `codeBg`, `danger`.
  - [ ] Implement 7 Dark Themes:
    - [ ] Hack The Box (Default: `#0F1923`, `#1B2738`, `#9FEF00`, `#FF3E3E`)
    - [ ] Tokyo Night (`#1A1B26`, `#7AA2F7`)
    - [ ] One Dark Pro (`#282C34`, `#61AFEF`)
    - [ ] Catppuccin Mocha (`#1E1E2E`, `#CBA6F7`)
    - [ ] Dracula (`#282A36`, `#BD93F9`, `#50FA7B`)
    - [ ] Nord (`#2E3440`, `#88C0D0`)
    - [ ] Gruvbox Dark (`#282828`, `#EBDBB2`, `#FE8019`)
  - [ ] Implement 5 Light Themes:
    - [ ] GitHub Light / Primer (`#FFFFFF`, `#F6F8FA`, `#0969DA`)
    - [ ] Catppuccin Latte (`#EFF1F5`, `#4C4F69`, `#1E66F5`)
    - [ ] Tokyo Night Day (`#E1E2E7`, `#3760BF`)
    - [ ] Solarized Light (`#FDF6E3`, `#657B83`, `#268BD2`)
    - [ ] One Light (`#FAFAFA`, `#383A42`, `#4078F2`)
- [ ] **2.2 Typography & Nerd Font Integration**
  - [ ] Configure **Fira Code Nerd Font** as default monospace with ligature support enabled.
  - [ ] Configure **Inter** as default proportional body font.
  - [ ] Implement user font selector cubit allowing system Nerd Font fallback (JetBrains Mono NF, Hack NF).
- [ ] **2.3 Desktop Platform-Adaptive Window Management**
  - [ ] Integrate `window_manager` for Linux, macOS, and Windows.
  - [ ] Build custom borderless HUD title bar widget with draggable window caption area.
  - [ ] Implement custom window controls (minimize, maximize/restore, close) matching active theme.
  - [ ] Add breadcrumbs trail to title bar (`Notebook > Section > Page`).
- [ ] **2.4 Theme TDD & Golden Test Suite**
  - [ ] Unit test `ThemeCubit` transitions across all 12 palettes.
  - [ ] Golden tests: snapshot custom window title bar, buttons, and HUD panes under Hack The Box and GitHub Light.

---

### Milestone 3: Drift SQLite DB, CRDT-Ready Schema & CAS Blob Storage
- [ ] **3.1 Relational Database Schema Design (`nodus_core`)**
  - [ ] Create `NotebooksTable`: `id`, `name`, `color`, `icon`, `sort_order`, `created_at_hlc`, `updated_at_hlc`, `deleted_at_hlc`.
  - [ ] Create `SectionsTable`: `id`, `notebook_id`, `name`, `color`, `sort_order`, `created_at_hlc`, `updated_at_hlc`, `deleted_at_hlc`.
  - [ ] Create `PagesTable`: `id`, `section_id`, `title`, `is_pinned`, `sort_order`, `created_at_hlc`, `updated_at_hlc`, `deleted_at_hlc`.
  - [ ] Create `NoteBlocksTable`:
    - `id` (UUID), `page_id`, `block_type` (TEXT enum), `sort_order` (REAL fractional index).
    - `content` (JSON payload string).
    - `crdt_state` (BLOB reserved for sequence CRDT deltas).
    - `created_at_hlc` (TEXT Hybrid Logical Clock), `updated_at_hlc` (TEXT).
- [ ] **3.2 Denormalized FTS5 Full-Text Search Table**
  - [ ] Implement `pages_fts` virtual table indexing `page_id`, `title`, `body_text`, `tags`, `code_snippets`.
  - [ ] Write Drift queries with BM25 ranking weights (`title` 5.0x, `tags` 3.0x, `content` 1.0x).
  - [ ] Implement snippet extraction helper with search hit highlighting.
- [ ] **3.3 Content-Addressable Storage (CAS) Engine**
  - [ ] Implement `BlobManager` storing physical files in `.nodus/blobs/<sha256_hash>`.
  - [ ] Implement `BlobsTable`: `hash`, `byte_size`, `mime_type`, `original_name`, `reference_count`, `created_at`.
  - [ ] Implement automatic deduplication logic (identical files share the same blob and increment `reference_count`).
  - [ ] Implement orphan detection query (blobs with `reference_count <= 0`).
- [ ] **3.4 Database TDD Suite**
  - [ ] In-memory SQLite tests for schema creation, foreign keys, and cascading soft-deletes.
  - [ ] Unit test fractional indexing ordering under rapid reorders.
  - [ ] Unit test FTS5 search performance and BM25 ranking across 1,000+ mock pages.
  - [ ] Unit test CAS blob deduplication and reference counting.

---

### Milestone 4: Domain Layer & Command History (Pure Dart TDD)
- [ ] **4.1 Polymorphic Block Domain Entities**
  - [ ] Define `sealed class NoteBlock` with Freezed:
    - [ ] `TextBlock`: plain text, markdown formatting tokens.
    - [ ] `HeadingBlock`: level (1, 2, 3), text.
    - [ ] `CodeBlock`: language, code content, prompt prefix strip settings.
    - [ ] `TerminalBlock`: ANSI log content, command string, exit code badge.
    - [ ] `ImageBlock`: CAS blob hash, alt text, width, compression state.
    - [ ] `TaskBlock`: raw text, parsed task entity link.
    - [ ] `VaultBlock`: encrypted payload, hint, algorithm (`AES-256-GCM`).
- [ ] **4.2 Reversible Command Pattern (Linear Undo/Redo)**
  - [ ] Implement `EditorCommand` abstract interface with `execute()` and `undo()`.
  - [ ] Implement `EditBlockContentCommand`.
  - [ ] Implement `InsertBlockCommand` (with auto-focus management).
  - [ ] Implement `DeleteBlockCommand` (preserves deleted block content for redo).
  - [ ] Implement `ReorderBlockCommand` (fractional index swap).
  - [ ] Implement `CommandHistory` managing linear undo/redo stacks per open page.
- [ ] **4.3 Pure Dart Use Cases**
  - [ ] `CreateNotebookUseCase`, `GetNotebookHierarchyUseCase`.
  - [ ] `SavePageBlocksUseCase` (atomic SQLite batch-save for dirty blocks).
  - [ ] `SearchNotesFtsUseCase` (FTS query and snippet highlighting).
  - [ ] `DetectSecretsUseCase` (regex inspection).
  - [ ] `ParseTasksUseCase` (inline task extraction).
- [ ] **4.4 Domain TDD Suite**
  - [ ] Unit test all use cases using `mocktail` for repository interfaces.
  - [ ] Unit test `CommandHistory` undo/redo sequences across complex multi-block edits.

---

### Milestone 5: Custom Block Editor & Presentation Workspace

#### 5a: Core Block Editor Engine
- [ ] **5a.1 EditableText Primitive Architecture**
  - [ ] Build `BlockEditorCanvas` rendering a vertical `ListView.builder` of dynamic blocks.
  - [ ] Implement per-block `FocusNode` and `TextEditingController` management inside `PageEditorBloc`.
- [ ] **5a.2 Keyboard Navigation & Focus Flow**
  - [ ] `Enter` at the end of a block inserts a new block immediately below and transfers focus.
  - [ ] `Backspace` on an empty block removes the block and positions cursor at the end of the preceding block.
  - [ ] `Up` / `Down` arrow keys navigate seamlessly between block boundaries.
- [ ] **5a.3 Auto-Save Debounce Engine**
  - [ ] Implement 1–2 second debounced auto-save on text mutations.
  - [ ] Flush dirty blocks immediately on blur, block reorder, or page switch.
  - [ ] Provide subtle in-canvas HUD save status indicator (`Saved`, `Saving...`, `Unsaved`).

#### 5b: Rich Text Formatting & Inline Stylers
- [ ] **5b.1 Inline Token Formatter**
  - [ ] Build custom `BlockTextEditingController` formatting inline markdown tokens:
    - Bold (`**text**`), Italic (`*text*`), Inline Code (`` `code` ``), Strikethrough (`~~text~~`), Hyperlinks (`[label](url)`).
  - [ ] Render styled spans in-place while keeping raw cursor positions accurate.
- [ ] **5b.2 List & Heading Block Widgets**
  - [ ] Implement `HeadingBlockWidget` (H1, H2, H3) with responsive typographic scaling.
  - [ ] Implement bullet list and ordered list prefix indent rendering.

#### 5c: Slash Commands, Drag-Drop & Reordering
- [ ] **5c.1 Slash Command Menu**
  - [ ] Typing `/` in an empty block opens an overlay popup menu.
  - [ ] Options: `/code` (Code Block), `/term` (Terminal Log), `/task` (Task Checkbox), `/img` (Image), `/vault` (Secret Vault).
  - [ ] Keyboard arrow selection and instant conversion on `Enter`.
- [ ] **5c.2 Block Reordering & Fractional Indexing**
  - [ ] Drag handle hover icon on the left gutter of every block.
  - [ ] Drag-and-drop reordering calculating new `sort_order = (prev + next) / 2` without re-indexing other blocks.

#### 5d: Command Palette & Keyboard Shortcuts
- [ ] **5d.1 Global Action Registry**
  - [ ] Centralize action triggers using Flutter's `Actions` and `Shortcuts` widgets.
  - [ ] Global shortcuts: `Ctrl+Z` (Undo), `Ctrl+Y` / `Ctrl+Shift+Z` (Redo), `Ctrl+S` (Force Flush Save), `Ctrl+F` (Find in Page).
- [ ] **5d.2 Fuzzy-Search Command Palette**
  - [ ] `Ctrl+Shift+P` (or `Cmd+Shift+P`) summons floating HUD command palette modal.
  - [ ] Fuzzy matching across all registered actions: change theme, new notebook, export, clean orphans.

#### 5e: OneNote Multi-Split HUD Workspace
- [ ] **5e.1 Three-Pane Resizable Layout**
  - [ ] Implement `multi_split_view` layout:
    - Left pane: Hierarchical Notebooks & Sections tree with collapse/expand toggles.
    - Middle pane: Section Pages list with search filter and pinned pages section.
    - Right pane: Main `BlockEditorCanvas` with View/Edit mode toggle.
  - [ ] Persist pane split ratios in local storage.

---

### Milestone 6: Smart Code Blocks & ANSI Terminal Output Engine
- [ ] **6.1 Smart Code Block Widget**
  - [ ] Multi-language syntax highlighting (Python, Go, Rust, C/C++, TypeScript, Dart, SQL, YAML, JSON, Bash, Dockerfile).
  - [ ] Monospace horizontal scrolling with sticky line numbers.
  - [ ] Language picker dropdown in header bar.
  - [ ] **Smart Copy Button:** One-click copy that auto-strips prompt prefixes (`$ `, `# `, `PS >`, `root@host:~#`).
- [ ] **6.2 ANSI 256-Color Terminal Log Engine**
  - [ ] Build custom `AnsiParser` converting raw ANSI escape sequences into styled Flutter `TextSpan` trees.
  - [ ] Render 16 standard ANSI colors + 256 extended palette colors.
  - [ ] Add terminal header with optional execution time and exit code badge (`Exit 0`, `Exit 137`).
- [ ] **6.3 TDD Verification**
  - [ ] Unit tests for `SmartCopyHelper` with various prompt prefix variants.
  - [ ] Unit tests for `AnsiParser` verifying color code accuracy and escape sequence sanitization.

---

### Milestone 7: SecretGuard Scanner & Dual-Write Task Parser
- [ ] **7.1 SecretGuard Heuristic Leak Scanner**
  - [ ] Define high-precision regex detectors for:
    - AWS Access Keys (`AKIA[0-9A-Z]{16}`)
    - GitHub Personal Access Tokens (`ghp_[0-9a-zA-Z]{36}`)
    - SSH Private Keys (`-----BEGIN (RSA|OPENSSH|EC) PRIVATE KEY-----`)
    - Generic High-Entropy API Keys & JWTs
  - [ ] Hook into auto-save debounce cycle; scan **only dirty blocks**.
  - [ ] Render inline alert banner on detected block: *"Sensitive secret detected: Mark as Vault Secret or Redact"*.
  - [ ] One-click action to convert block into encrypted `VaultBlock`.
- [ ] **7.2 Dual-Write Inline Task Parser**
  - [ ] Implement grammar parser for inline task blocks:
    - `- [ ] Task title @due(YYYY-MM-DD HH:mm) @priority(high|med|low) @status(todo|in_progress|done|blocked) @estimate(4h) @recur(RRULE...) #tag`
  - [ ] Automatically extract attributes on save debounce and populate relational `tasks` Drift table.
  - [ ] Clicking checkbox in UI updates both the raw note block text and the relational task record atomically.
- [ ] **7.3 TDD Verification**
  - [ ] Unit tests for `SecretScanner` verifying precision and false-positive resistance.
  - [ ] Unit tests for `TaskParser` verifying date/time and tag extraction.

---

### Milestone 8: Storage Breakdown Dashboard & Isolate Image Compression
- [ ] **8.1 Isolate-Backed Image Optimizer**
  - [ ] Spawn dedicated background Dart isolate using `image` package.
  - [ ] Auto-downscale clipboard screenshots exceeding 1920px width while keeping code text crisp.
  - [ ] Convert images to optimized WebP format before storing in CAS.
  - [ ] Expose manual "Compress Image" button on individual `ImageBlockWidget` instances.
- [ ] **8.2 Storage Inspector HUD Modal**
  - [ ] Compute workspace storage metrics (total disk space, database size, blob storage size).
  - [ ] Breakdown by media category (Images, Documents, Binaries/PCAPs, Text).
  - [ ] Display top 10 largest attachments with one-click navigation to parent note.
  - [ ] **Orphan Blob Cleaner:** Detect blobs with `reference_count == 0` and purge unreferenced files with one click.
- [ ] **8.3 TDD Verification**
  - [ ] Unit tests for isolate compression and dimension clamping.
  - [ ] Unit tests for storage metrics calculation and orphan cleaner logic.

---

### Milestone 9: End-to-End Integration Test Suite
- [ ] **9.1 Full User Journey Tests (`integration_test`)**
  - [ ] Journey 1: Create Notebook -> Create Section -> Create Page -> Enter text & code blocks.
  - [ ] Journey 2: Verify auto-save persists data to SQLite and updates `pages_fts`.
  - [ ] Journey 3: Search keyword in FTS search bar -> Verify page hit and highlighted snippet.
  - [ ] Journey 4: Paste mock AWS secret key -> Verify SecretGuard alert appears immediately.
  - [ ] Journey 5: Enter task syntax -> Verify relational task table populated.
  - [ ] Journey 6: Reorder blocks via drag-and-drop -> Verify persistent `sort_order`.
  - [ ] Journey 7: Execute multi-step undo and redo across block modifications.

---

## 🚀 Phase 2: Standalone MCP Server CLI, Kanban, Gantt & Export Suite

### Milestone 10: Standalone MCP CLI Server (`packages/nodus_mcp`)
- [ ] **10.1 CLI Executable Scaffolding**
  - [ ] Implement `bin/nodus_mcp_server.dart` entry point.
  - [ ] Multi-process SQLite WAL mode compatibility test with running GUI application.
- [ ] **10.2 Transport Implementations**
  - [ ] **STDIO Transport:** Standard input/output JSON-RPC 2.0 loop for sub-process spawning by AI tools (Claude Desktop, Cursor, Antigravity).
  - [ ] **HTTP/SSE Transport:** Authenticated LAN server with 256-bit cryptographic bearer token and optional subnet whitelist.
- [ ] **10.3 MCP Tool Endpoints & Access Control**
  - [ ] Implement MCP tools: `list_notebooks`, `read_page`, `search_notes`, `append_block`, `create_page`.
  - [ ] Per-notebook / per-section RBAC matrix (`Full Access`, `Read-Only`, `Air-Gapped`).
  - [ ] Real-time tamper-evident JSON audit log.

---

### Milestone 11: Interactive Kanban Board View
- [ ] **11.1 Kanban Board Layout**
  - [ ] Multi-column board view grouping relational tasks by **Status** (`Todo`, `In Progress`, `Blocked`, `Done`), **Priority**, or **Tags**.
  - [ ] Filter board by Notebook, Section, or Global Workspace.
- [ ] **11.2 Bidirectional Drag-and-Drop Synchronization**
  - [ ] Dragging a task card across status columns updates the relational `tasks` record.
  - [ ] Automatically rewrites the `@status(...)` attribute inside the underlying note block text.

---

### Milestone 12: Interactive Gantt Chart & Timeline View
- [ ] **12.1 Timeline Engine**
  - [ ] Render chronological timeline utilizing `@start(...)`, `@due(...)`, and `@estimate(...)` metadata.
  - [ ] Zoom levels: Day, Week, Month, Quarter.
- [ ] **12.2 Dependencies & Milestones**
  - [ ] Support `@depends_on(task_id)` attribute with visual connector lines.
  - [ ] Highlight critical path and render `@milestone` flag badges.

---

### Milestone 13: Project & Task Export Suite
- [ ] **13.1 Multi-Format Exporters**
  - [ ] **Mermaid Gantt Syntax:** Export timeline directly to Markdown Mermaid `gantt` code block.
  - [ ] **iCalendar (`.ics`):** Export schedules to external calendar applications (Google Calendar, Outlook).
  - [ ] **Structured CSV & JSON:** Machine-readable export for Jira/Linear ingestion.
  - [ ] **OPML / MS Project XML:** Hierarchical task breakdown export.
  - [ ] **Markdown Executive Summary:** Render checklist report with completion percentages.

---

### Milestone 14: Specialized Technical Blocks
- [ ] **14.1 LaTeX / KaTeX Equation Block**
  - [ ] In-line and display math rendering for cryptographic formulas and algorithms.
- [ ] **14.2 Hex / Memory Dump Viewer Block**
  - [ ] Tri-column layout (`Offset | Hex Bytes | ASCII`) for payload analysis and binary inspection.

---

## 🌐 Phase 3: Decentralized P2P Sync & Zero-Knowledge Cloud Backup

### Milestone 15: P2P Device Discovery & Handshake
- [ ] **15.1 Discovery Transports**
  - [ ] BLE (Bluetooth Low Energy) advertising and scanning for nearby peer devices.
  - [ ] Visual fallback: QR code exchange displaying ephemeral Diffie-Hellman public keys.
- [ ] **15.2 Mutual Authentication**
  - [ ] Ephemeral Curve25519 key exchange establishing secure TLS session keys.

---

### Milestone 16: CRDT Delta Sync Engine
- [ ] **16.1 Local Wi-Fi Payload Transfer**
  - [ ] High-speed mDNS discovery and TLS-encrypted local TCP / WebRTC socket connection.
- [ ] **16.2 Conflict-Free Sequence Synchronization**
  - [ ] Exchange binary CRDT updates (`crdt_state`) between paired devices.
  - [ ] Automatic convergence for concurrently edited notes without data loss.

---

### Milestone 17: Incremental Zero-Knowledge Google Drive Backup
- [ ] **17.1 Client-Side Cryptography**
  - [ ] Master passphrase key derivation using memory-hard `Argon2id`.
  - [ ] Authenticated encryption using `AES-256-GCM` / `XChaCha20-Poly1305`.
- [ ] **17.2 Incremental Manifest Protocol**
  - [ ] Maintain encrypted `manifest.json.enc` in hidden `drive.appdata` folder.
  - [ ] Upload only new CAS blobs and modified note bundles.
  - [ ] Implement Grandfather-Father-Son (GFS) retention (7 daily, 4 weekly, 3 monthly) on manifest snapshots.

---

## 🖥️ Phase 4: Desktop Enhancements & Mobile Production Hardening

### Milestone 18: System-Wide Global Quick-Capture
- [ ] **18.1 Global Hotkey Daemon**
  - [ ] Register global desktop shortcut (`Ctrl+Shift+Space`).
  - [ ] Summon borderless floating scratchpad overlay from any workspace.
  - [ ] Auto-save scratchpad directly into a designated "Inbox" section.

---

### Milestone 19: Desktop Multi-Window Detachable Views
- [ ] **19.1 Multi-Window Engine**
  - [ ] Pop out individual reference pages into secondary native OS windows for multi-monitor setups.
  - [ ] Shared SQLite WAL connection keeping detached windows synchronized in real-time.

---

### Milestone 20: Mobile Platform Optimization & Battery Efficiency
- [ ] **20.1 Android / iOS Ergonomics**
  - [ ] Touch gestures, mobile drawer navigation, and virtual keyboard avoidance.
  - [ ] Exact reminder alarms using Android `AlarmManager` and iOS notification requests.
  - [ ] Background sync scheduling using `WorkManager` respecting battery constraints.
