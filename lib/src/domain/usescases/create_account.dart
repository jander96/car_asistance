import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:car_assistance/src/domain/repositories/user_repository.dart';
import 'package:car_assistance/src/domain/usescases/regist_license.dart';
import 'package:car_assistance/src/domain/usescases/regist_user.dart';

class CreateAccountUseCase {
  final UserRepository _userRepository;
  final RegistUserUseCase _registUserInSystem;
  final RegistLicenseUseCase _registLicenseUseCase;
  CreateAccountUseCase()
      : _userRepository = injector.get<UserRepository>(),
        _registUserInSystem = injector.get<RegistUserUseCase>(),
        _registLicenseUseCase = injector.get<RegistLicenseUseCase>();

  Future<AppUser?> createAccount(
      {String email = '', String password = ''}) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // create con Email
      try {
        final user = await _userRepository.registbyEmail(email, password);
        if (user != null) {
          _userRepository.storeUserSessionState(true);
        } else {
          _userRepository.storeUserSessionState(false);
        }
        if (user != null) await _registUserInSystem.registUserInSystem(user);
        if (user != null) await _registLicenseUseCase.registLicenseForThisUser(user);
        return user;
      } on Exception catch (e) {
        return Future.error(e);
      }
    } else {
      // access con Google
      try {
        final user = await _userRepository.accessWithGoogle();
        if (user != null) {
          _userRepository.storeUserSessionState(true);
        } else {
          _userRepository.storeUserSessionState(false);
        }
        if (user != null) await _registUserInSystem.registUserInSystem(user);
        if (user != null) await _registLicenseUseCase.registLicenseForThisUser(user);
        return user;
      } on Exception catch (e) {
        return Future.error(e);
      }
    }
  }
}
