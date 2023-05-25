import 'package:car_assistance/src/data/database/daos/license_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';

import '../../../../dependency_injection.dart';
import 'license_local_datasource.dart';

class LicenseLocalDatasourceImpl extends LicenseLocalDataSource {
  final LicenseDao _licenseDao;
  LicenseLocalDatasourceImpl() : _licenseDao = injector.get<LicenseDao>();

  @override
  Future<int> deleteLicense() {
    return _licenseDao.removeLicense();
  }

  @override
  Future<int> registLicense(LicenseEntity license) {
    return _licenseDao.addLicense(license);
  }

  @override
  Future<LicenseEntity> getLicense() {
    return _licenseDao.getLicense();
  }
}
