import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'api_affiliate_model.g.dart';

@JsonSerializable()
class AffiliateNetwork {
  final String id;
  final String name;
  @JsonKey(name: "open_time")
  final String? openTime;
  @JsonKey(name: "close_time")
  final String? closeTime;
  @JsonKey(name: "is_full_time_service")
  final bool isFullTimeService;
  @JsonKey(name: "phone_number")
  final String phoneNumber;
  final double rating;
  final double lat;
  final double long;
  final String address;
  final List<String> services;

  AffiliateNetwork(
      {required this.id,
      required this.name,
      required this.openTime,
      required this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.rating,
      required this.lat,
      required this.long,
      required this.address,
      required this.services});

  factory AffiliateNetwork.fromJson(Map<String, dynamic> json) =>
      _$AffiliateNetworkFromJson(json);
}

extension AffilateExtensions on AffiliateNetwork {
  Affiliate toDomain() => Affiliate(
      id: id,
      name: name,
      openTime: openTime,
      closeTime: closeTime,
      isFullTimeService: isFullTimeService,
      phoneNumber: phoneNumber,
      rating: rating,
      lat: lat,
      long: long,
      address: address,
      services: services);
}
