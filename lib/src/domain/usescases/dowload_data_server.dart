import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/repositories/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/domain/repositories/rating_repository.dart';
import 'package:flutter/material.dart';

import '../model/rating_model.dart';

class DowloadDataServerUseCase {
  final AffiliateRepository _affiliateRepo;
  final RatingRepository _ratingRepository;

  DowloadDataServerUseCase()
      : _affiliateRepo = injector.get<AffiliateRepository>(),
        _ratingRepository = injector.get<RatingRepository>();

  void downloadData() async {
    //Limpiar datos antiguos de affiliate y rating
    debugPrint('limpiando base de datos <seguimiento>');
    _affiliateRepo.cleanAllAffiliatesInDb();
    _ratingRepository.cleanAllRatingsInDB();

    // Obtner nuevos datos de affiliate y rating
    debugPrint('obteniendo nuevos datos <seguimiento>');
    final List<Affiliate> listOfAffiliates =
        await _affiliateRepo.getAllAffiliate();
    final List<Rating> listOfRating = await _ratingRepository.getAllRatings();

    // Guardar en base de datos
    debugPrint('guardando ratings <seguimiento>');
    for (final rating in listOfRating) {
      await _ratingRepository.storeRatingInDB(rating);
    }
    for (final affiliate in listOfAffiliates) {
      //Actualizar valoracion antes de guardar en base de datos
      final averageRating =
          await _ratingRepository.getRatingOfAffiliate(affiliate.id);
      final affiliateUpdate = affiliate.copyWith(rating: averageRating);
      debugPrint('guardando affiliates <seguimiento>');
      await _affiliateRepo.saveAffiliatesInDb(affiliateUpdate);
    }
  }
}
