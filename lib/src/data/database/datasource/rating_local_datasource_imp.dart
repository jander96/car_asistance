import 'package:car_assistance/src/data/database/daos/rating_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/datasource/rating_local_datasource.dart';

import '../../../../dependency_injection.dart';

class RatingLocalDataSourceImp extends RatingLocalDataSource {
  final RatingDao _ratingDao;

  RatingLocalDataSourceImp() : _ratingDao = injector.get<RatingDao>();
  @override
  Future<int> clearAllRating() {
    return _ratingDao.cleanAllRatings();
  }

  @override
  Future<double> getRatingOfAffiliate(String affiliateId) {
    return _ratingDao.getRatingOfAffiliate(affiliateId);
  }

  @override
  Future<int> insertRating(RatingsEntity rating) {
   return  _ratingDao.insertRating(rating);
  }
}
