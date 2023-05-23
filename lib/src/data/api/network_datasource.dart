import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';

import '../services/models/user_service.dart';
import 'model/api_license_model.dart';

abstract class NetworkDataSource {
  Future<List<AffiliateNetwork>> getAllAffiliate();
  Future<List<RatingNetwork>> getAllRatings();
  Future<void> postNewRating(RatingNetwork rating);
  Future<void> addNewUser(UserNetwork user);
  Future<void> updateUser(UserNetwork user);
  Future<UserNetwork> getUser(String userId);
  Future<void> registLicense(LicenseNetwork license);
  Future<void> updateLicense(LicenseNetwork license);
  Future<LicenseNetwork> getLicenseForThisUser(String userId);
}
