import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthService {
  final firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<User?> authUserStatus() {
    //* if null -> signout else signin
    return firebaseAuth.authStateChanges();
  }

  Future<User?> createUserWithEmailAndPassword(
      String email, String password) async {
    try {
      final credencial = await firebaseAuth.createUserWithEmailAndPassword(
          email: email, password: password);
      return credencial.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'email-already-in-use':
          return Future.error(Exception('exists an account with the given email address'));

        case 'invalid-email':
          return Future.error(Exception('email address is not valid'));

        case 'invalid-operation-not-allowed':
          return Future.error(Exception('email/password accounts are not enabled'));

        case 'weak-password':
          return Future.error(Exception('password is not strong enough'));

        default:
          return Future.error(Exception('unknow server error'));
      }
    } on Exception catch (e) {
      return Future.error(Exception(e.toString()));
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credencial = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credencial.user;
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case 'user-disabled':
          return Future.error(
              'user corresponding to the given email has been disabled');

        case 'invalid-email':
          return Future.error('email address is not valid');

        case 'user-not-found':
          return Future.error(
              'there is no user corresponding to the given email');

        case 'wrong-password':
          return Future.error('wrong-password');

        default:
          return Future.error('unknow server error');
      }
    } on Exception catch (e) {
      return Future.error(e.toString());
    }
  }

  Future<User?> accessWithGoogle() async {
    // Trigger the authentication flow
    try {
      _googleSignIn.signOut();
      
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // This line fixes the crash
      if (googleUser == null) throw Exception("Not logged in");

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;

      // Create a new credential
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential = await firebaseAuth.signInWithCredential(credential);

      return userCredential.user;
    } catch (e) {
      return Future.error(e);
    }
  }

  Future<void> logOut() {
    try {
      return firebaseAuth.signOut();
    } on Exception catch (e) {
      return Future.error(e);
    }
  }
}
