import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';

extension AffiliateMapper on AffiliatesEntity {
  Affiliate toDomain() {
    return Affiliate(
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
        services: _servicesToList(services));
  }

  List<String> _servicesToList(String services) => services.split(",").toList();
}

AffiliatesEntity affiliatesEntityfromDomain(Affiliate affiliate) {
  return AffiliatesEntity(
      id: affiliate.id,
      name: affiliate.name,
      openTime: affiliate.openTime ,
      closeTime: affiliate.closeTime,
      isFullTimeService: affiliate.isFullTimeService,
      phoneNumber: affiliate.phoneNumber,
      rating: affiliate.rating,
      lat: affiliate.lat,
      long: affiliate.long,
      address: affiliate.address,
      services: affiliate.services.join(","));
}
