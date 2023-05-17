import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/services/models/user_mapper.dart';
import 'package:car_assistance/src/domain/user_repository.dart';
import '../../domain/model/user_model.dart';
import '../services/auth_datasource.dart';

class UserRepositoryImp extends UserRepository {
  final AuthDataSource _authDataSource;

  UserRepositoryImp() : _authDataSource = injector.get<AuthDataSource>();

  @override
  Future<AppUser?> accessWithGoogle()  {
   return _authDataSource.googleAccess().then((user) => user?.toDomain());
    
  }

  @override
  Stream<AppUser?> watchUserStatusChanges() {
    return _authDataSource
        .watchUserStatusChanges()
        .transform(AppUserTransformer.transformToDomain);
  }

  @override
  Future<AppUser?> loginbyEmail(String email, String password){
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
  Future<bool> saveDataUserInServer() {
    // TODO: implement saveDataUserInServer
    throw UnimplementedError();
  }

  @override
  Future<bool> saveDataUserLocally() {
    // TODO: implement saveDataUserLocally
    throw UnimplementedError();
  }
}
