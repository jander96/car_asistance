

import 'model/user_model.dart';

abstract class UserRepository {
  Stream<AppUser?> watchUserStatusChanges();
  Future<AppUser?> registbyEmail(String email, String password);
  Future<AppUser?> loginbyEmail(String email, String password);
  Future<AppUser?> accessWithGoogle();
  Future<void> logout();
  Future<bool> saveDataUserInServer(AppUser user);
  Future<bool> saveDataUserLocally(AppUser user);
  Future<void> storeUserSessionState(bool isSessionActive);
   Future<bool> verifyUserLog();
}
