import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/services/models/user_mapper.dart';
import 'package:car_assistance/src/domain/user_repository.dart';
import '../../domain/model/user_model.dart';
import '../services/auth_datasource.dart';
import '../services/key_value_storage_datasource.dart';

class UserRepositoryImp extends UserRepository {
  final AuthDataSource _authDataSource;
  final KeyValueStorageDatasource _keyValueStorageDatasource;
  static const USER_SESSION_STATE = 'USER_SESSION_STATE';

  UserRepositoryImp()
      : _authDataSource = injector.get<AuthDataSource>(),
        _keyValueStorageDatasource = injector.get<KeyValueStorageDatasource>();

  @override
  Future<AppUser?> accessWithGoogle() {
    return _authDataSource.googleAccess().then((user) => user?.toDomain());
  }

  @override
  Stream<AppUser?> watchUserStatusChanges() {
    return _authDataSource
        .watchUserStatusChanges()
        .transform(AppUserTransformer.transformToDomain);
  }

  @override
  Future<AppUser?> loginbyEmail(String email, String password) {
    return _authDataSource
        .emailLogin(email, password)
        .then((user) => user?.toDomain());
  }

  @override
  Future<void> logout() {
    return _authDataSource.logOut();
  }

  @override
  Future<AppUser?> registbyEmail(String email, String password) async {
    return _authDataSource
        .emailRegister(email, password)
        .then((user) => user?.toDomain());
  }

  @override
  @override
  Future<bool> verifyUserLog() {
    return _keyValueStorageDatasource
        .getValue<bool>(USER_SESSION_STATE)
        .then((isActive) {
      if (isActive != null) return isActive;
      return false;
    });
  }

  @override
  Future<bool> saveDataUserInServer(AppUser user) {
    // TODO: implement saveDataUserInServer
    throw UnimplementedError();
  }

  @override
  Future<bool> saveDataUserLocally(AppUser user) {
    // TODO: implement saveDataUserLocally
    throw UnimplementedError();
  }

  @override
  Future<void> storeUserSessionState(bool isSessionActive) {
    return _keyValueStorageDatasource.setKeyValue(
        USER_SESSION_STATE, isSessionActive);
  }
}
