import 'models/user_service.dart';

abstract class AuthDataSource {
  Stream<UserNetwork?> watchUserStatusChanges();
  Future<UserNetwork?> emailRegister(String email, String password);
  Future<UserNetwork?> emailLogin(String email, String password);
  Future<UserNetwork?> googleAccess();
  Future<void> logOut();
  Future<void> restorePassword(String email);
}
