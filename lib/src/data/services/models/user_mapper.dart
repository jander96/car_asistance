import 'package:car_assistance/src/domain/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

extension UserExtension on User {
  AppUser toDomain() {
    return AppUser(email: email ?? "", name: displayName ?? "");
  }
}
