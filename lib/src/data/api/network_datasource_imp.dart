import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/api_service.dart';
import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';

class NetworkDataSourceImpl extends NetworkDataSource {
  final ApiService _apiservice;
  NetworkDataSourceImpl() : _apiservice = injector.get<ApiService>();

  @override
  Future<List<AffiliateNetwork>> getAllAffiliate() {
    return _apiservice.getAllAffiliates();
  }

  @override
  Future<List<RatingNetwork>> getAllRatings() {
    return _apiservice.getAllRatings();
  }

  @override
  Future postNewRating(RatingNetwork rating) {
    return _apiservice.postNewRating(rating);
  }
}
