import 'package:car_assistance/src/data/database/drift_database.dart';

import '../../../../domain/model/rating_model.dart';

extension RatingMapper on RatingsEntity {
  Rating toDomain() {
    return Rating(id, affiliateId, rating);
  }
}

RatingsEntity ratingsEntityFromDomain(Rating rating) => RatingsEntity(
    id: rating.id, affiliateId: rating.affiliateId, rating: rating.rating);
