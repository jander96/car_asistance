import 'model/affiliate_model.dart';


abstract class AffiliateRepository {
  Stream<List<Affiliate>> watchAffiliates();
  Future<List<Affiliate>> getAllAffiliate();
  void saveAffiliatesInDb(Affiliate affiliate);
  void cleanAllAffiliatesInDb();
}
