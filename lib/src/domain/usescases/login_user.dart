import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:car_assistance/src/domain/user_repository.dart';

class LoginUserUseCase {
  final UserRepository _userRepository;
  LoginUserUseCase() : _userRepository = injector.get<UserRepository>();

  Future<AppUser?> login({String email = '', String password = ''}) {
    if (email.isNotEmpty && password.isNotEmpty) {
      // log con Email
      return _userRepository.loginbyEmail(email, password);
    } else {
      // log con Google
      return _userRepository.accessWithGoogle();
    }
  }
}
