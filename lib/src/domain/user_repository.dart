

import 'model/user_model.dart';

abstract class UserRepository {
  Stream<AppUser?> watchUserStatusChanges();
  Future<AppUser?> registbyEmail(String email, String password);
  Future<AppUser?> loginbyEmail(String email, String password);
  Future<AppUser?> accessWithGoogle();
  Future<void> logout();
  Future<bool> saveDataUserInServer();
  Future<bool> saveDataUserLocally();
   Future<bool> verifyUserLog();
}
