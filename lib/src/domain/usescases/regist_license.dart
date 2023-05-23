import 'package:car_assistance/src/domain/license_repository.dart';

import 'package:car_assistance/src/domain/model/user_model.dart';

import '../../../dependency_injection.dart';
import '../model/license_model.dart';
import 'get_end_of_free_period.dart';

class RegistLicenseUseCase {
  final LicenseRepository _licenseRepository;
  final GetEndOfFreePeriodUseCase _getEndOfFreePeriodUseCase;
  RegistLicenseUseCase()
      : _licenseRepository = injector.get<LicenseRepository>(),
        _getEndOfFreePeriodUseCase = injector.get<GetEndOfFreePeriodUseCase>();

  Future<void> registLicenseForThisUser(AppUser user) async {
    try {
      final license = License(
          userId: user.uid,
          freePeriodDateEnd: _getEndOfFreePeriodUseCase.getEndOfFreePeriod(7),
          isPayDone: false);

      await _licenseRepository.registLicenseInServer(license);
      final licenseFromServer =
          await _licenseRepository.getLicenseFromServer(user.uid);
      _licenseRepository.registLicenseLocally(licenseFromServer);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
