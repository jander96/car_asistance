import 'package:drift/drift.dart';

class UserEntitys extends Table {
  TextColumn get id => text()();
  TextColumn get uid => text()();
  TextColumn get userName => text()();
  TextColumn get email => text()();
  TextColumn get phoneNumber => text()();
  BoolColumn get emailVerified => boolean()();
  BoolColumn get isAnonymous => boolean()();
  TextColumn get photoURL => text()();
  TextColumn get refreshToken => text()();
}
