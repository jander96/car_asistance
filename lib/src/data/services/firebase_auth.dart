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
      return Future.error(e);
    } on Exception catch (e) {
      return Future.error(Exception(e));
    }
  }

  Future<User?> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final credencial = await firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      return credencial.user;
    } on FirebaseAuthException catch (e) {
      return Future.error(e);
    } on Exception catch (e) {
      return Future.error(e);
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

      final userCredential =
          await firebaseAuth.signInWithCredential(credential);

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

 Future<void> restorePassword(String email) {
    try {
     return firebaseAuth.sendPasswordResetEmail(email: email);

    } on Exception catch (e) {
     return Future.error(e);
    }
  }
}
