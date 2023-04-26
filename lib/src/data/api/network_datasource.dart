import 'package:car_assistance/src/data/api/model/api_model.dart';


abstract class NetworkDataSource {
  Future<List<AffiliateNetwork>> getAllAffiliate();
}