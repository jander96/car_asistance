import 'model/affiliate_model.dart';

abstract class NetworkDataSource {
  Future<List<Affiliate>> getAllAffiliate();
}