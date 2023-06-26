import 'package:car_assistance/src/data/database/drift_database.dart';

abstract class LicenseLocalDataSource {
  Future<LicenseEntity> getLicense();
  Future<int> registLicense(LicenseEntity license);
  Future<int> deleteLicense();
}
