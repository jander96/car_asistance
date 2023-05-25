import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/model/favorites.dart';
import 'package:drift/drift.dart';


part 'favorite_dao.g.dart';

@DriftAccessor(tables: [Favorites])
class FavoritesDao extends DatabaseAccessor<AppDatabase> with _$FavoritesDaoMixin {
  FavoritesDao(AppDatabase db) : super(db);
  Future<List<Favorite>> getFavorites() {
   return select(favorites).get();
  }

  Future<int> addFavorite(Favorite fav){
    return into(favorites).insert(fav);
  }

  Future<int> removeFavorite(String id) {
    return (delete(favorites)..where((tbl) => tbl.affiliateId.equals(id)))
        .go();
  }
}
