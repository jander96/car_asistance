import 'package:car_assistance/src/data/database/drift_database.dart';


abstract class AffiliateLocalDataSource {
  Future<int> addAffiliate(AffiliatesEntity affiliate);
  Stream<List<AffiliatesEntity>> allAffiliateStream();
  Future<int> deleteAllAffiliates();
  Stream<List<AffiliatesEntity>> getBestRating(int top);
}
