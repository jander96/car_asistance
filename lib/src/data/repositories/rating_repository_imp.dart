import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';
import 'package:car_assistance/src/data/database/rating_local_datasource.dart';
import 'package:car_assistance/src/domain/model/rating_model.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';

import '../api/network_datasource.dart';
import '../database/model/mapper/rating_mapper.dart';

class RatingRepositoryImp extends RatingRepository {
  final NetworkDataSource _networkDataSource;
  final RatingLocalDataSource _ratingLocalDataSource;

  RatingRepositoryImp()
      : _networkDataSource = injector.get<NetworkDataSource>(),
        _ratingLocalDataSource = injector.get<RatingLocalDataSource>();

  @override
  void cleanAllRatingsInDB() {
    _ratingLocalDataSource.clearAllRating();
  }

  @override
  Future<List<Rating>> getAllRatings() {
    return _networkDataSource.getAllRatings().then((listOfRating) =>
        listOfRating.map((rating) => rating.toDomain()).toList());
  }

  @override
  Future posNewRating(Rating rating) {
    final ratingNetwork = RatingNetwork.fromDomain(rating);
    return _networkDataSource.postNewRating(ratingNetwork);
  }

  @override
  void storeRatingInDB(Rating rating) {
    final entity = ratingsEntityFromDomain(rating);
    _ratingLocalDataSource.insertRating(entity);
  }

  @override
  Future<double> getRatingOfAffiliate(String affiliateId) {
    return _ratingLocalDataSource.getRatingOfAffiliate(affiliateId);
  }
}
