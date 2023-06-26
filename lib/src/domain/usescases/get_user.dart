import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/repositories/user_repository.dart';

import '../model/user_model.dart';

class GetUserUseCase {
  final UserRepository _userRepository;
  GetUserUseCase() : _userRepository = injector.get<UserRepository>();

  Future<AppUser> getUser() {
    return _userRepository.getUserFromDB();
  }
}
