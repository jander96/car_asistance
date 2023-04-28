import 'package:car_assistance/src/data/database/drift_database.dart';

abstract class LocalDataSource {
  Future<int> addAffiliate(AffiliatesEntity affiliate);
  Stream<List<AffiliatesEntity>> allAffiliateStream();
  void deleteAllAffiliates();
}
