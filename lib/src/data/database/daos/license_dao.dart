import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:drift/drift.dart';

import '../model/license_entity_model.dart';
part 'license_dao.g.dart';

@DriftAccessor(tables: [LicenseEntitys])
class LicenseDao extends DatabaseAccessor<AppDatabase> with _$LicenseDaoMixin {
  LicenseDao(AppDatabase db) : super(db);
  Future<LicenseEntity> getLicense() {
   return select(licenseEntitys).getSingle();
  }

  Future<int> addLicense(LicenseEntity license) async {
    return into(licenseEntitys).insert(license);
  }

  Future<int> removeLicense() {
    return delete(licenseEntitys).go();
  }
}
