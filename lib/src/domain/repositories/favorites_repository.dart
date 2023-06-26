abstract class FavoriteRepository {
  Future<bool> toggleFavorite(String id);
  Future<List<String>> getFavorites();
  Future<bool> isFavorite(String id);
}
