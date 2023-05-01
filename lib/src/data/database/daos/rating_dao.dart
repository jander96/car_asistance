import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:drift/drift.dart';

import '../model/rating_entity_model.dart';

part 'rating_dao.g.dart';

@DriftAccessor(tables: [RatingsEntitys])
class RatingDao extends DatabaseAccessor<AppDatabase> with _$RatingDaoMixin {
  RatingDao(AppDatabase db) : super(db);
  Future<double> getRatingOfAffiliate(String affiliateId) async {
    final ratingAvg = ratingsEntitys.rating.avg();

    final query = selectOnly(ratingsEntitys)
      ..addColumns([ratingAvg])
      ..where(ratingsEntitys.affiliateId.equals(affiliateId));

    final average =
        await query.map((row) => row.read(ratingAvg)).getSingle() ?? 0.0;
    return average;
  }

  Future<int> insertRating(RatingsEntity rating) {
    return into(ratingsEntitys).insert(rating);
  }

  Future<int> cleanAllRatings() {
   return delete(ratingsEntitys).go();
  }
 
}
