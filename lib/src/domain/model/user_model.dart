class AppUser {
  final String id;
  final String uid;
  final String username;
  final String email;
  final String phoneNumber;
  final bool emailVerified;
  final bool isAnonymous;
  final String photoURL;
  final String refreshToken;

  AppUser(
      {required this.id,
      required this.uid,
      required this.username,
      required this.email,
      required this.phoneNumber,
      required this.emailVerified,
      required this.isAnonymous,
      required this.photoURL,
      required this.refreshToken});
}
