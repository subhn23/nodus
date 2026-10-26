// ignore_for_file: unused_field
import 'package:drift/drift.dart';
import '../app_database.dart';

part 'search_dao.g.dart';

/// Data class representing an FTS5 search hit.
class FtsSearchResult {
  final String pageId;
  final String title;
  final String titleSnippet;
  final String bodySnippet;
  final String codeSnippet;
  final double rank;

  const FtsSearchResult({
    required this.pageId,
    required this.title,
    required this.titleSnippet,
    required this.bodySnippet,
    required this.codeSnippet,
    required this.rank,
  });
}

@DriftAccessor()
class SearchDao extends DatabaseAccessor<AppDatabase> with _$SearchDaoMixin {
  SearchDao(super.db);

  /// Synchronizes full-text search index for a given page.
  /// Replaces any existing index entry with the denormalized text content.
  Future<void> indexPage({
    required String pageId,
    required String title,
    required String bodyText,
    String tags = '',
    String codeSnippets = '',
  }) async {
    await customStatement(
      'DELETE FROM pages_fts WHERE page_id = ?;',
      [pageId],
    );

    await customStatement(
      '''
      INSERT INTO pages_fts(page_id, title, body_text, tags, code_snippets)
      VALUES (?, ?, ?, ?, ?);
      ''',
      [pageId, title, bodyText, tags, codeSnippets],
    );
  }

  /// Removes a deleted page from the FTS5 index.
  Future<void> deletePageFromIndex(String pageId) async {
    await customStatement(
      'DELETE FROM pages_fts WHERE page_id = ?;',
      [pageId],
    );
  }

  /// Executes an FTS5 query with weighted BM25 ranking across title, body, tags, and code.
  Future<List<FtsSearchResult>> search(String rawQuery, {int limit = 50}) async {
    final sanitizedQuery = _sanitizeFtsQuery(rawQuery);
    if (sanitizedQuery.trim().isEmpty) return [];

    final rows = await customSelect(
      '''
      SELECT 
        page_id,
        title,
        snippet(pages_fts, 1, '<b>', '</b>', '...', 12) AS title_snippet,
        snippet(pages_fts, 2, '<b>', '</b>', '...', 20) AS body_snippet,
        snippet(pages_fts, 4, '<b>', '</b>', '...', 20) AS code_snippet,
        bm25(pages_fts, 0.0, 5.0, 1.0, 3.0, 2.0) AS rank
      FROM pages_fts
      WHERE pages_fts MATCH ?
      ORDER BY rank
      LIMIT ?;
      ''',
      variables: [
        Variable.withString(sanitizedQuery),
        Variable.withInt(limit),
      ],
    ).get();

    return rows.map((row) {
      return FtsSearchResult(
        pageId: row.read<String>('page_id'),
        title: row.read<String>('title'),
        titleSnippet: row.read<String>('title_snippet'),
        bodySnippet: row.read<String>('body_snippet'),
        codeSnippet: row.read<String>('code_snippet'),
        rank: row.read<double>('rank'),
      );
    }).toList();
  }

  /// Sanitizes raw user search input into valid FTS5 tokens.
  String _sanitizeFtsQuery(String input) {
    // Strip special FTS5 operators to prevent syntax errors
    final cleaned = input.replaceAll(RegExp(r'[*"+\-^~:]'), ' ').trim();
    final tokens = cleaned.split(RegExp(r'\s+')).where((t) => t.isNotEmpty);
    if (tokens.isEmpty) return '';

    // Prefix search for the last token so user gets live results while typing
    final tokenList = tokens.toList();
    final lastToken = '${tokenList.removeLast()}*';
    tokenList.add(lastToken);

    return tokenList.join(' ');
  }
}
