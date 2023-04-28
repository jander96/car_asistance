// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_rating_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RatingNetwork _$RatingNetworkFromJson(Map<String, dynamic> json) =>
    RatingNetwork(
      json['id'] as String,
      json['affiliated_id'] as String,
      (json['rating'] as num).toDouble(),
    );

Map<String, dynamic> _$RatingNetworkToJson(RatingNetwork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'affiliated_id': instance.affiliateId,
      'rating': instance.rating,
    };
