import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/domain/model/user_model.dart';

extension UserMapper on UserEntity {
  AppUser toDomain() {
    return AppUser(
      id: id,
      uid: uid,
      username: userName,
      email: email,
      emailVerified: emailVerified,
      isAnonymous: isAnonymous,
      phoneNumber: phoneNumber,
      photoURL: photoURL,
      refreshToken: refreshToken,
    );
  }
}

UserEntity userEntityFromDomain(AppUser user) => UserEntity(
    id: user.id,
    uid: user.uid,
    userName: user.username,
    email: user.email,
    phoneNumber: user.phoneNumber,
    emailVerified: user.emailVerified,
    isAnonymous: user.isAnonymous,
    photoURL: user.photoURL,
    refreshToken: user.refreshToken);
