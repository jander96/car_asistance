import 'package:car_assistance/src/domain/model/app_user.dart';

abstract class UserRepository {
  Stream<AppUser?> authUserStatus();
  Future<bool> registbyEmail(String email, String password);
  Future<bool> loginbyEmail(String email, String password);
  Future<bool> accessWithGoogle();
  Future<void> logout();
  Future<bool> saveDataUserInServer();
  Future<bool> saveDataUserLocally();
}
