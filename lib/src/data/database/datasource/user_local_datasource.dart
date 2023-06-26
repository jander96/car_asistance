import 'package:car_assistance/src/data/database/drift_database.dart';

abstract class UserLocalDataSource {
  Future<UserEntity> getUser();
  Future<int> saveUser(UserEntity user);
  Future<int> deleteUser();
}
