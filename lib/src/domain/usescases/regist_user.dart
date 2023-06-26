import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:car_assistance/src/domain/repositories/user_repository.dart';

class RegistUserUseCase {
  final UserRepository _userRepository;
  RegistUserUseCase() : _userRepository = injector.get<UserRepository>();

  Future<void> registUserInSystem(AppUser user) async {
    try {
      await _userRepository.saveDataUserInServer(user);
      final userFromServer = await _userRepository.getUserFromServer(user.uid);
      await _userRepository.deleteUserInDb();
      await _userRepository.saveDataUserLocally(userFromServer);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future<void> loadUserFromSystem(AppUser user) async {
    try {
      final userFromServer = await _userRepository.getUserFromServer(user.uid);
      await _userRepository.deleteUserInDb();
      await _userRepository.saveDataUserLocally(userFromServer);
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
