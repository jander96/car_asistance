import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/model/user_entity_model.dart';
import 'package:drift/drift.dart';
part 'user_dao.g.dart';

@DriftAccessor(tables: [UserEntitys])
class UserDao extends DatabaseAccessor<AppDatabase> with _$UserDaoMixin {
  UserDao(AppDatabase db) : super(db);

  Future<UserEntity> getUser() {
   return select(userEntitys).get().then((list) => list.first);

  }

  Future<int> addUser(UserEntity user) {
    return into(userEntitys).insert(user);
  }

  Future<int> deleteUser() {
    return delete(userEntitys).go();
  }
}
