import 'package:car_assistance/src/data/api/api_affiliate_service.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/api/network_datasource_imp.dart';
import 'package:car_assistance/src/data/database/sqflite_database.dart';
import 'package:get_it/get_it.dart';
import 'package:sqflite/sqflite.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiAffiliateService>(ApiAffiliateService());
  injector.registerFactory<NetworkDataSource>(() => NetworkDataSourceImpl());
  
}
