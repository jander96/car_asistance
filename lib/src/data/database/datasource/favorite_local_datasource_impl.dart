import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/database/daos/favorite_dao.dart';
import 'package:car_assistance/src/data/database/datasource/favorite_local_datasource.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';



class FavoriteDatasourceImpl extends FavoriteDataSource {
  final FavoritesDao _favoritesDao;
  FavoriteDatasourceImpl() : _favoritesDao = injector.get<FavoritesDao>();
  @override
  Future<int> addFavorite(String fav) {
    return _favoritesDao.addFavorite(Favorite(affiliateId: fav));
  }

  @override
  Future<List<String>> getFavorites() {
    return _favoritesDao
        .getFavorites().then((favorites) => favorites.map((fav) => fav.affiliateId).toList());
  }

  @override
  Future<int> removeFavorite(String id) {
    return _favoritesDao.removeFavorite(id);
  }
}
