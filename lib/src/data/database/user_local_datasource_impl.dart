import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/database/daos/user_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/user_local_datasource.dart';

class UserLocalDatasourceImpl extends UserLocalDataSource {
  final UserDao _userDao;
  UserLocalDatasourceImpl() : _userDao = injector.get<UserDao>();
  @override
  Future<int> deleteUser() {
    return _userDao.deleteUser();
  }

  @override
  Future<int> saveUser(UserEntity user) {
    return _userDao.addUser(user);
  }

  @override
  Future<UserEntity> getUser() {
    return _userDao.getUser();
  }
}
