import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_license_model.dart';
import 'package:car_assistance/src/data/database/model/mapper/license_mapper.dart';
import 'package:car_assistance/src/domain/repositories/license_repository.dart';
import 'package:car_assistance/src/domain/model/license_model.dart';

import '../api/network_datasource.dart';
import '../database/datasource/license_local_datasource.dart';

class LicenseRepositoryImpl extends LicenseRepository {
  final NetworkDataSource _networkDataSource;
  final LicenseLocalDataSource _licenseLocalDataSource;

  LicenseRepositoryImpl()
      : _networkDataSource = injector.get<NetworkDataSource>(),
        _licenseLocalDataSource = injector.get<LicenseLocalDataSource>();
  @override
  Future<void> cleanLicenseInDB() {
    return _licenseLocalDataSource.deleteLicense();
  }

  @override
  Future<License> getLicenseFromDB() {
    return _licenseLocalDataSource
        .getLicense()
        .then((entity) => entity.toDomain());
  }

  @override
  Future<License> getLicenseFromServer(String id) {
    return _networkDataSource
        .getLicenseForThisUser(id)
        .then((network) => network.toDomain());
  }

  @override
  Future<void> registLicenseInServer(License license) {
    return _networkDataSource.registLicense(LicenseNetwork.fromDomain(license));
  }

  @override
  Future<void> registLicenseLocally(License license) {
    return _licenseLocalDataSource
        .registLicense(licenseEntityFromDomain(license));
  }

  @override
  Future<void> updateLiceseInServer(License license) {
    return _networkDataSource.updateLicense(LicenseNetwork.fromDomain(license));
  }
}
