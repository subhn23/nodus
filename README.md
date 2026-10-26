# Nodus

> Cross-platform, local-first, peer-to-peer technical workspace and note-taking application for software developers, network architects, and cybersecurity professionals.

---

## 📚 Project Documentation

All specifications, architectural designs, and implementation plans are strictly maintained in the [`docs/`](./docs) directory:

* 📄 **[Technical Specification & Architecture](./docs/SPECIFICATION.md)**: Detailed breakdown of the local-first storage, P2P sync, encrypted Google Drive backup, Hack The Box theming, and secure MCP protocol.
* 📋 **[Phase 1 Implementation Plan (TDD)](./docs/IMPLEMENTATION_PLAN.md)**: Test-driven development roadmap, milestone targets, and verification steps.

---

## 🛠️ Tech Stack & Foundations

* **Framework:** Flutter (Linux, Windows, macOS, Android, Web, iOS)
* **Architecture:** Clean Architecture + TDD (Test-Driven Development)
* **State Management:** BLoC (`flutter_bloc`)
* **Database & Search:** Drift (SQLite with FTS5 Full-Text Search)
* **Security:** `flutter_secure_storage`, Argon2id key derivation, AES-256-GCM encryption
* **AI Integration:** Model Context Protocol (MCP) local STDIO and authenticated LAN HTTP/SSE
