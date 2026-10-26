import '../data/database/daos/search_dao.dart';

/// Use case querying the SQLite FTS5 index with weighted BM25 ranking.
class SearchNotesFtsUseCase {
  final SearchDao _searchDao;

  SearchNotesFtsUseCase(this._searchDao);

  Future<List<FtsSearchResult>> execute(String query, {int limit = 50}) {
    return _searchDao.search(query, limit: limit);
  }
}
