import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/database/datasource/favorite_local_datasource.dart';
import 'package:car_assistance/src/domain/repositories/favorites_repository.dart';

class FavoriteRepoImpl extends FavoriteRepository {
  final FavoriteDataSource _favoriteDataSource;
  FavoriteRepoImpl() : _favoriteDataSource = injector.get<FavoriteDataSource>();
  @override
  Future<List<String>> getFavorites() {
    return _favoriteDataSource.getFavorites();
  }

  @override
  Future<bool> toggleFavorite(String id) async {
    final isInFavorite = await isFavorite(id);
    if (isInFavorite) {
      await _favoriteDataSource.removeFavorite(id);
    } else {
      await _favoriteDataSource.addFavorite(id);
    }
    return isFavorite(id);
  }

  @override
  Future<bool> isFavorite(String id) {
    return _favoriteDataSource.getFavorites().then((favorites) => favorites.contains(id));
  }
}
