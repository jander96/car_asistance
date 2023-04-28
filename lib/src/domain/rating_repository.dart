import 'model/rating_model.dart';

abstract class RatingRepository {
  Future<List<Rating>> getAllRatings();
  Future posNewRating(Rating rating);

  void cleanAllRatingsInDB();
  void storeRatingInDB(Rating rating);
}
