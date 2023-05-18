import '../../../dependency_injection.dart';
import '../user_repository.dart';

class GetLogStateUseCase {
  final UserRepository _userRepository;
  GetLogStateUseCase() : _userRepository = injector.get<UserRepository>();

  Future<bool> verifyUserLog() {
    return _userRepository.verifyUserLog();
  }
}
