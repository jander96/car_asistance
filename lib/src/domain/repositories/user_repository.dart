import '../model/user_model.dart';

abstract class UserRepository {
  Stream<AppUser?> watchUserStatusChanges();
  Future<AppUser?> registbyEmail(String email, String password);
  Future<AppUser?> loginbyEmail(String email, String password);
  Future<AppUser?> accessWithGoogle();
  Future<void> logout();
  Future<void> restorePassword(String email);
  Future<void> saveDataUserInServer(AppUser user);
  Future<void> updateDataUserInServer(AppUser user);
  Future<AppUser> getUserFromServer(String userId);
  Future<void> saveDataUserLocally(AppUser user);
  Future<void> deleteUserInDb();
  Future<void> storeUserSessionState(bool isSessionActive);
  Future<AppUser> getUserFromDB();
  Future<bool> verifyUserLog();
}
