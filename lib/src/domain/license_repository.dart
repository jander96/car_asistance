import 'package:car_assistance/src/domain/model/license_model.dart';

abstract class LicenseRepository {
  Future<void> registLicenseInServer(License license);
  Future<License> getLicenseFromServer(String id);
  Future<void> updateLiceseInServer(License license);

  Future<void> registLicenseLocally(License license);
  Future<License> getLicenseFromDB();
  Future<void> cleanLicenseInDB();
}
