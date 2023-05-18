import '../../../dependency_injection.dart';
import '../user_repository.dart';

class SingOutUseCase {
  final UserRepository _userRepository;
  SingOutUseCase() : _userRepository = injector.get<UserRepository>();

  Future<void> signout() {
    return _userRepository.logout().then((_) {
      _userRepository.storeUserSessionState(false);
    });
  }
}
