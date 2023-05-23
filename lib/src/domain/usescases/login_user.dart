import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:car_assistance/src/domain/user_repository.dart';
import 'package:car_assistance/src/domain/usescases/regist_user.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;
  final RegistUserUseCase _registUserInSystem;
  LoginUserUseCase() : _userRepository = injector.get<UserRepository>(),
  _registUserInSystem = injector.get<RegistUserUseCase>();

  Future<AppUser?> login({String email = '', String password = ''}) async {
    if (email.isNotEmpty && password.isNotEmpty) {
      // log con Email
      try {
        final user = await _userRepository.loginbyEmail(email, password);
        if (user != null) {
          _userRepository.storeUserSessionState(true);
        } else {
          _userRepository.storeUserSessionState(false);
        }
         if (user != null) await _registUserInSystem.loadUserFromSystem(user);
        return user;
      } on Exception catch (e) {
        return Future.error(e);
      }
    } else {
      // log con Google
       try {
        final user = await _userRepository.accessWithGoogle();
        if (user != null) {
          _userRepository.storeUserSessionState(true);
        } else {
          _userRepository.storeUserSessionState(false);
        }
         if (user != null) await _registUserInSystem.loadUserFromSystem(user);
        return user;
      } on Exception catch (e) {
        return Future.error(e);
      }
    }
  }
}
