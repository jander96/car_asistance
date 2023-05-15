import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/repositories/stream_transformer.dart';
import 'package:car_assistance/src/data/services/firebase_auth.dart';
import 'package:car_assistance/src/domain/model/app_user.dart';
import 'package:car_assistance/src/domain/user_repository.dart';

class UserRepositoryImp extends UserRepository {
  final FirebaseAuthService _firebaseAuth;
  UserRepositoryImp() : _firebaseAuth = injector.get<FirebaseAuthService>();
  @override
  Future<bool> accessWithGoogle() async {
    final result = await _firebaseAuth.accessWithGoogle();
    return result.user != null;
  }

  @override
  Future<bool> loginbyEmail(String email, String password) async {
    final result =
        await _firebaseAuth.signInWithEmailAndPassword(email, password);
    return result.user != null;
  }

  @override
  Future<void> logout() {
    return _firebaseAuth.logOut();
  }

  @override
  Future<bool> registbyEmail(String email, String password) async {
    final result =
        await _firebaseAuth.createUserWithEmailAndPassword(email, password);
    return result.user != null;
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

  @override
  Stream<AppUser?> authUserStatus() {
    final transformer = ConvertToAppUser();
    return _firebaseAuth.authUserStatus().transform(transformer.transformToDomain);
  }
}
