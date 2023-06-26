import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/repositories/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';


class WatchAllAffiliatesUsesCase {
  final AffiliateRepository _affiliateRepo;
 

  WatchAllAffiliatesUsesCase()
      : _affiliateRepo = injector.get<AffiliateRepository>();

  Stream<List<Affiliate>> watchAffiliates() async* {
    
    yield* _affiliateRepo.watchAffiliates();
  }
}
