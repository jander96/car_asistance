import 'package:car_assistance/src/domain/model/rating_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_rating_model.g.dart';

@JsonSerializable()
class RatingNetwork {
  final String id;
  @JsonKey(name: "affiliated_id")
  final String affiliateId;
  final double rating;

  RatingNetwork(this.id, this.affiliateId, this.rating);

  factory RatingNetwork.fromJson(Map<String, dynamic> jsonMap) =>
      _$RatingNetworkFromJson(jsonMap);

  Map<String, dynamic> toJsonMap() => _$RatingNetworkToJson(this);

  static RatingNetwork fromDomain(Rating rating) =>
    RatingNetwork( rating.id.isEmpty ? "" : rating.id , rating.affiliateId, rating.rating);
}

extension RatingNetwworkExtension on RatingNetwork {
  Rating toDomain() => Rating(id, affiliateId, rating);
}


