import 'package:car_assistance/src/data/database/drift_database.dart';

abstract class RatingLocalDataSource {
  Future<double> getRatingOfAffiliate(String affiliateId);
  Future<int> insertRating(RatingsEntity rating);
  Future<int> clearAllRating();
}
