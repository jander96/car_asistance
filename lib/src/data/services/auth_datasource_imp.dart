import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/services/models/user_mapper.dart';
import 'package:car_assistance/src/data/services/models/user_service.dart';

import 'auth_datasource.dart';
import 'firebase_auth.dart';

class FirebaseAuthDatasource extends AuthDataSource {
  final FirebaseAuthService _firebaseAuthService;

  FirebaseAuthDatasource()
      : _firebaseAuthService = injector.get<FirebaseAuthService>();

  @override
  Future<UserNetwork?> emailLogin(String email, String password) {
    return _firebaseAuthService
        .signInWithEmailAndPassword(email, password)
        .then((user) => user?.toNetwork());
  }

  @override
  Future<UserNetwork?> emailRegister(String email, String password){
    return _firebaseAuthService
        .createUserWithEmailAndPassword(email, password)
        .then((user) => user?.toNetwork());
  }

  @override
  Future<UserNetwork?> googleAccess() async {
    return _firebaseAuthService
        .accessWithGoogle()
        .then((user) => user?.toNetwork());
  }

  @override
  Future<void> logOut() {
    return _firebaseAuthService.logOut();
  }

  @override
  Stream<UserNetwork?> watchUserStatusChanges() {
    return _firebaseAuthService
        .authUserStatus()
        .transform(UserNetworkTransformer.transformToNetwork);
  }
}
