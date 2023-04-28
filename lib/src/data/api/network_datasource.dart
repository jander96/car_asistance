import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';

abstract class NetworkDataSource {
  Future<List<AffiliateNetwork>> getAllAffiliate();
  Future<List<RatingNetwork>> getAllRatings();
  Future postNewRating(RatingNetwork rating);
}
