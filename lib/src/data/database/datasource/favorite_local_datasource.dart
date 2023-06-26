

abstract class FavoriteDataSource {
  Future<List<String>> getFavorites();
  Future<int> addFavorite(String fav);
  Future<int> removeFavorite(String id);
}
