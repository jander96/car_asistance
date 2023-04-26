import 'model/affiliate_model.dart';

abstract class AffiliateRepository{
   Stream<List<Affiliate>> getAllAffiliate();
   void saveAffiliatesInDb();
   void cleanAllAffiliatesInDb();
}