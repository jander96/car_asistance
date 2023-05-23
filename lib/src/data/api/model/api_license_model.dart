import 'package:car_assistance/src/domain/model/license_model.dart';

class LicenseNetwork {
  final String? id;
  final String? userId;
  final String? freePeriodDateEnd;
  final bool? isPayDone;

  LicenseNetwork(
      {this.id, this.userId, this.freePeriodDateEnd, this.isPayDone});
  factory LicenseNetwork.fromJsonMap(String id, Map<String, dynamic> jsonMap) =>
      LicenseNetwork(
          id: id,
          userId: jsonMap["user_id"],
          freePeriodDateEnd: jsonMap["free_period_date_end"],
          isPayDone: jsonMap["is_pay_done"]);

  Map<String, dynamic> toMapJson() {
    return {
      "user_id": userId,
      "free_period_date_end": freePeriodDateEnd,
      "is_pay_done": isPayDone
    };
  }

  static LicenseNetwork fromDomain(License license) => LicenseNetwork(
      id: license.id,
      userId: license.userId,
      freePeriodDateEnd: license.freePeriodDateEnd,
      isPayDone: license.isPayDone);
}

extension LicenseNetworkExtension on LicenseNetwork {
  License toDomain() => License(
      id: id ?? "",
      userId: userId ?? "",
      freePeriodDateEnd: freePeriodDateEnd ?? "",
      isPayDone: isPayDone ?? false);
}
