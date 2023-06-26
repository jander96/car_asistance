import 'package:car_assistance/src/domain/model/affiliate_model.dart';




class AffiliateNetwork {
  final String id;
  final String name;
  final String imageUrl;
  final String? openTime;
  final String? closeTime;
  final bool isFullTimeService;
  final String phoneNumber;
  final double rating;
  final double lat;
  final double long;
  final String address;
  final List<String> services;
  final String state;

  AffiliateNetwork(
      {required this.id,
      required this.name,
      required this.imageUrl, 
      required this.openTime,
      required this.closeTime,
      required this.isFullTimeService,
      required this.phoneNumber,
      required this.rating,
      required this.lat,
      required this.long,
      required this.address,
      required this.services,
      required this.state});

  factory AffiliateNetwork.fromJson(String id ,Map<String, dynamic> json) => AffiliateNetwork(
      id: id,
      name: json['name'] as String,
      imageUrl: json['image_url'] as String,
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
      state: json['state'] as String,
    );
      


    
}

extension AffilateExtensions on AffiliateNetwork {
  Affiliate toDomain() => Affiliate(
      id: id,
      name: name,
      imageUrl: imageUrl,
      openTime: openTime,
      closeTime: closeTime,
      isFullTimeService: isFullTimeService,
      phoneNumber: phoneNumber,
      rating: rating,
      lat: lat,
      long: long,
      address: address,
      services: services,
      state: state);
}
