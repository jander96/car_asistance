import 'model/user_model.dart';

abstract class UserRepository {
  Stream<AppUser?> watchUserStatusChanges();
  Future<AppUser?> registbyEmail(String email, String password);
  Future<AppUser?> loginbyEmail(String email, String password);
  Future<AppUser?> accessWithGoogle();
  Future<void> logout();
  Future<void> restorePassword(String email);
  Future<void> saveDataUserInServer(AppUser user);
  Future<void> updateDataUserInServer(AppUser user);
  Future<void> saveDataUserLocally(AppUser user);
  Future<void> storeUserSessionState(bool isSessionActive);
  Future<bool> verifyUserLog();
}
