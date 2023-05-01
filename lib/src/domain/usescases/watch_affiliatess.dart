import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';

class WatchAllAffiliatesUsesCase {
  final AffiliateRepository _affiliateRepo;
  final RatingRepository _ratingRepository;
  WatchAllAffiliatesUsesCase()
      : _affiliateRepo = injector.get<AffiliateRepository>(),
        _ratingRepository = injector.get<RatingRepository>();

  Stream<List<Affiliate>> watchAffiliates() async* {
    //Limpiar datos antiguos
    _affiliateRepo.cleanAllAffiliatesInDb();
    _ratingRepository.cleanAllRatingsInDB();

    final List<Affiliate> listOfAffiliates =
        await _affiliateRepo.getAllAffiliate();

    for (final affiliate in listOfAffiliates) {
      //Actualizar valoracion antes de guardar en base de datos 
      final averageRating =
          await _ratingRepository.getRatingOfAffiliate(affiliate.id);
      final affiliateUpdate = affiliate.copyWith(rating: averageRating);
      await _affiliateRepo.saveAffiliatesInDb(affiliateUpdate);
    }
    yield* _affiliateRepo.watchAffiliates();
  }
}
