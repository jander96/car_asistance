class UserNetwork {
  final String? id;
  final String? displayName;
  final String? email;
  final bool? emailVerified;
  final bool? isAnonymous;
  final String? phoneNumber;
  final String? photoURL;
  final String? refreshToken;

  UserNetwork(
      {this.id,
      this.displayName,
      this.email,
      this.emailVerified,
      this.isAnonymous,
      this.phoneNumber,
      this.photoURL,
      this.refreshToken});
}
