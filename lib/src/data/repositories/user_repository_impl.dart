import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/database/user_local_datasource.dart';
import 'package:car_assistance/src/data/services/models/user_mapper.dart';
import 'package:car_assistance/src/data/services/models/user_service.dart';
import 'package:car_assistance/src/domain/user_repository.dart';
import '../../domain/model/user_model.dart';
import '../database/model/mapper/user_mapper.dart';
import '../services/auth_datasource.dart';
import '../services/key_value_storage_datasource.dart';

class UserRepositoryImp extends UserRepository {
  final AuthDataSource _authDataSource;
  final NetworkDataSource _networkDataSource;
  final UserLocalDataSource _userLocalDataSource;
  final KeyValueStorageDatasource _keyValueStorageDatasource;
  static const USER_SESSION_STATE = 'USER_SESSION_STATE';

  UserRepositoryImp()
      : _authDataSource = injector.get<AuthDataSource>(),
        _networkDataSource = injector.get<NetworkDataSource>(),
        _userLocalDataSource = injector.get<UserLocalDataSource>(),
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
  Future<void> saveDataUserInServer(AppUser user) {
    return _networkDataSource.addNewUser(UserNetwork.fromDomain(user));
  }

  @override
  Future<void> saveDataUserLocally(AppUser user) {
    return _userLocalDataSource.saveUser(userEntityFromDomain(user));
  }

  @override
  Future<void> storeUserSessionState(bool isSessionActive) {
    return _keyValueStorageDatasource.setKeyValue(
        USER_SESSION_STATE, isSessionActive);
  }

  @override
  Future<void> restorePassword(String email) {
    return _authDataSource.restorePassword(email);
  }

  @override
  Future<void> updateDataUserInServer(AppUser user) {
    return _networkDataSource.updateUser(UserNetwork.fromDomain(user));
  }
}
