import 'model/affiliate_model.dart';


abstract class AffiliateRepository {
  Stream<List<Affiliate>> watchAffiliates();
  Future<List<Affiliate>> getAllAffiliate();
  Future<int> saveAffiliatesInDb(Affiliate affiliate);
  Future<int> cleanAllAffiliatesInDb();
}
