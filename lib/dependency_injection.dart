import 'package:car_assistance/src/data/api/api_affiliate_service.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/api/network_datasource_imp.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/local_datasource.dart';
import 'package:car_assistance/src/data/database/local_datasource_imp.dart';
import 'package:car_assistance/src/data/repositories/affiliate_repository_imp.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiAffiliateService>(ApiAffiliateService());
  injector.registerFactory<NetworkDataSource>(() => NetworkDataSourceImpl());
  injector.registerFactory<LocalDataSource>(() => LocalDataSourceImp());
  injector.registerSingleton<AppDatabase>(AppDatabase());
  injector.registerFactory<AffiliateRepository>(() => AffiliateRepositoryImp());
}
