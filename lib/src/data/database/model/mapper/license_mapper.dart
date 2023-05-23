import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/domain/model/license_model.dart';

extension LicenseMapper on LicenseEntity {
  License toDomain() {
    return License(
        id: id,
        userId: userId,
        freePeriodDateEnd: freePeriodDateEnd,
        isPayDone: isPayDone);
  }
}

LicenseEntity licenseEntityFromDomain(License license) => LicenseEntity(
    id: license.id,
    userId: license.userId,
    freePeriodDateEnd: license.freePeriodDateEnd,
    isPayDone: license.isPayDone);
