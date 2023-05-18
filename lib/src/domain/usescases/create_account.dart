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
     
    } else {
      // access con Google
      return _userRepository.accessWithGoogle();
      
    }
  }
}
