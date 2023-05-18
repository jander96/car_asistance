import 'package:car_assistance/src/data/services/key_value_storage_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceService extends KeyValueStorageDatasource {
  Future<SharedPreferences> getSharedPrefs() async {
    return await SharedPreferences.getInstance();
  }

  @override
  Future<T?> getValue<T>(String key) async {
    final pref = await getSharedPrefs();
    switch (T) {
      case int:
        return pref.getInt(key) as T?;

      case String:
        return pref.getString(key) as T?;
      case bool:
        return pref.getBool(key) as T?;

      default:
        throw UnimplementedError(
            "Type of get ${T.runtimeType} not implemented please add to Shared");
    }
  }

  @override
  Future<bool> removeKey(String key) async {
    final pref = await getSharedPrefs();
    return await pref.remove(key);
  }

  @override
  Future<void> setKeyValue<T>(String key, T value) async {
    final pref = await getSharedPrefs();
    switch (T) {
      case int:
        pref.setInt(key, value as int);
        break;
      case String:
        pref.setString(key, value as String);
        break;
      case bool:
        pref.setBool(key, value as bool);
        break;
      default:
        throw UnimplementedError(
            "Type of set ${T.runtimeType} not implemented please add to Shared");
    }
  }
}
