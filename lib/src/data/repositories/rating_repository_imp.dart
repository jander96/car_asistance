import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';
import 'package:car_assistance/src/domain/model/rating_model.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';

import '../../domain/local_datasource.dart';
import '../api/network_datasource.dart';

class RatingRepositoryImp extends RatingRepository {
  final NetworkDataSource _networkDataSource;

  RatingRepositoryImp()
      : _networkDataSource = injector.get<NetworkDataSource>();

  @override
  void cleanAllRatingsInDB() {
    // TODO: implement cleanAllRatingsInDB
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
    // TODO: implement storeRatingInDB
  }
}
