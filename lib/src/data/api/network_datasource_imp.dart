import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/api/model/api_license_model.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/services/models/user_service.dart';

import 'firestore_service.dart';

class NetworkDataSourceImpl extends NetworkDataSource {
  final FirestoreService _apiservice;
  NetworkDataSourceImpl() : _apiservice = injector.get<FirestoreService>();

  @override
  Future<List<AffiliateNetwork>> getAllAffiliate() {
    return _apiservice.getAllAffiliates();
  }

  @override
  Future<List<RatingNetwork>> getAllRatings() {
    return _apiservice.getAllRatings();
  }

  @override
  Future<void> postNewRating(RatingNetwork rating) {
    return _apiservice.postNewRating(rating);
  }

  @override
  Future<void> addNewUser(UserNetwork user) {
    return _apiservice.addNewUser(user);
  }

  @override
  Future<UserNetwork> getUser(String userId) {
    return _apiservice.getUser(userId);
  }

  @override
  Future<LicenseNetwork> getLicenseForThisUser(String userId) {
    return _apiservice.getLicenseForThisUser(userId);
  }

  @override
  Future<void> registLicense(LicenseNetwork license) {
    return _apiservice.registLicense(license);
  }

  @override
  Future<void> updateUser(UserNetwork user) {
    return _apiservice.updateUser(user);
  }

  @override
  Future<void> updateLicense(LicenseNetwork license) {
    return _apiservice.updateLicense(license);
  }
}
