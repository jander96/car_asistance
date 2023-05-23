import 'package:car_assistance/src/domain/model/rating_model.dart';


class RatingNetwork {
  final String id;
  final String affiliateId;
  final double rating;

  RatingNetwork(this.id, this.affiliateId, this.rating);

  factory RatingNetwork.fromJson(String id,Map<String,dynamic> jsonMap) {
    
    return RatingNetwork(
      id,
      jsonMap["affiliate_id"].toString(),
      jsonMap["rating"] /1 as double

    );
  }

  Map<String, dynamic> toMapJson() {
    return {
      "affiliate_id": affiliateId,
      "rating": rating,
    };
  }

  static RatingNetwork fromDomain(Rating rating) => RatingNetwork(
      rating.id.isEmpty ? "" : rating.id, rating.affiliateId, rating.rating);
}

extension RatingNetwworkExtension on RatingNetwork {
  Rating toDomain() => Rating(id, affiliateId, rating);
}
