import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:car_assistance/src/domain/user_repository.dart';

class CreateAccountUseCase {
  final UserRepository _userRepository;
  CreateAccountUseCase() : _userRepository = injector.get<UserRepository>();

  Future<AppUser?> createAccount({String email = '', String password = ''}) {
    if (email.isNotEmpty && password.isNotEmpty) {
      // create con Email
      return _userRepository.registbyEmail(email, password);
      //TODO hacer enciptacion y proceso de guardar datos del usuario en server
    } else {
      // access con Google
      return _userRepository.accessWithGoogle();
      //TODO hacer enciptacion y proceso de guardar datos del usuario en server
    }
  }
}
