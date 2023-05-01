import 'model/rating_model.dart';

abstract class RatingRepository {
  Future<List<Rating>> getAllRatings();
  Future posNewRating(Rating rating);
  Future<double> getRatingOfAffiliate(String affiliateId);
  Future<int> cleanAllRatingsInDB();
  Future<int> storeRatingInDB(Rating rating);
}
