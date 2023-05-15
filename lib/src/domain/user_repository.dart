abstract class UserRepository {
  Future<bool> registbyEmail();
  Future<bool> loginbyEmail();
  Future<bool> registByGoogle();
  Future<bool> loginByGoogle();
  Future<bool> logout();
  Future<bool> saveDataUserInServer();
  Future<bool> saveDataUserLocally();
}
