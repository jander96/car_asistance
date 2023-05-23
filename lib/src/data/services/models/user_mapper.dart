import 'dart:async';
import 'package:car_assistance/src/data/services/models/user_service.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserExtension on User {
  UserNetwork toNetwork() {
    return UserNetwork(
        uid: uid,
        displayName: displayName,
        email: email,
        emailVerified: emailVerified,
        isAnonymous: isAnonymous,
        phoneNumber: phoneNumber,
        photoURL: photoURL,
        refreshToken: refreshToken);
  }
}

class UserNetworkTransformer {
  static final transformToNetwork =
      StreamTransformer<User, UserNetwork>.fromHandlers(
          handleData: (user, sink) {
    final userNetwork = user.toNetwork();
    sink.add(userNetwork);
  });
}
class AppUserTransformer {
  static final transformToDomain =
      StreamTransformer<UserNetwork, AppUser>.fromHandlers(
          handleData: (user, sink) {
    final appUser = user.toDomain();
    sink.add(appUser);
  });
}
extension UserNetworkExtension on UserNetwork {
  AppUser toDomain() {
    return AppUser(
        id: id ?? "",
        uid: uid ?? "",
        username: displayName ?? "",
        email: email ?? "",
        phoneNumber: phoneNumber ?? "",
        emailVerified: emailVerified ?? false,
        isAnonymous: isAnonymous ?? false,
        photoURL: photoURL ??
            "https://th.bing.com/th/id/R.70539295fbd82cf866d02ccacaee6cba?rik=K%2f40F0IUYGEEHA&pid=ImgRaw&r=0",
        refreshToken: refreshToken ?? "");
  }
}
