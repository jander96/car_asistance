import '../../../dependency_injection.dart';
import '../repositories/user_repository.dart';

class RestorePasswordUseCase {
  final UserRepository _userRepository;
  RestorePasswordUseCase() : _userRepository = injector.get<UserRepository>();

  Future<void> restorePassword(String email) {
    return _userRepository.restorePassword(email);
  }
}
