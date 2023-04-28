// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AffiliateNetwork _$AffiliateNetworkFromJson(Map<String, dynamic> json) =>
    AffiliateNetwork(
      id: json['id'] as String,
      name: json['name'] as String,
      openTime: json['open_time'] as String?,
      closeTime: json['close_time'] as String?,
      isFullTimeService: json['is_full_time_service'] as bool,
      phoneNumber: json['phone_number'] as String,
      rating: (json['rating'] as num).toDouble(),
      lat: (json['lat'] as num).toDouble(),
      long: (json['long'] as num).toDouble(),
      address: json['address'] as String,
      services:
          (json['services'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$AffiliateNetworkToJson(AffiliateNetwork instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'open_time': instance.openTime,
      'close_time': instance.closeTime,
      'is_full_time_service': instance.isFullTimeService,
      'phone_number': instance.phoneNumber,
      'rating': instance.rating,
      'lat': instance.lat,
      'long': instance.long,
      'address': instance.address,
      'services': instance.services,
    };
