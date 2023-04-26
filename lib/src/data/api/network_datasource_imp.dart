import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/api_affiliate_service.dart';
import 'package:car_assistance/src/data/api/model/api_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';

class NetworkDataSourceImpl extends NetworkDataSource {
  final ApiAffiliateService _apiservice;
  NetworkDataSourceImpl() : _apiservice = injector.get<ApiAffiliateService>();

  @override
  Future<List<AffiliateNetwork>> getAllAffiliate() {
    return _apiservice.getAllAffiliates();
  }
}
