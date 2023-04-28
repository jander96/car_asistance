import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';

class WatchAllAffiliatesUsesCase {
  final AffiliateRepository _affiliateRepo;
  WatchAllAffiliatesUsesCase()
      : _affiliateRepo = injector.get<AffiliateRepository>();

  Stream<List<Affiliate>> watchAffiliates() async* {
    _affiliateRepo.cleanAllAffiliatesInDb();
    final List<Affiliate> listOfAffiliates =
        await _affiliateRepo.getAllAffiliate();
    for (final affiliate in listOfAffiliates) {
      _affiliateRepo.saveAffiliatesInDb(affiliate);
    }
    yield* _affiliateRepo.watchAffiliates();
  }
}
