import 'package:car_assistance/src/data/api/api_service.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/api/network_datasource_imp.dart';
import 'package:car_assistance/src/data/database/daos/affiliate_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/local_datasource.dart';
import 'package:car_assistance/src/data/database/local_datasource_imp.dart';
import 'package:car_assistance/src/data/repositories/affiliate_repository_imp.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerFactory<NetworkDataSource>(() => NetworkDataSourceImpl());
  injector.registerFactory<LocalDataSource>(() => LocalDataSourceImp());
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());

  final db = injector.get<AppDatabase>();
  injector.registerLazySingleton<AffiliateDao>(() => AffiliateDao(db));
  
  injector.registerFactory<AffiliateRepository>(() => AffiliateRepositoryImp());
  injector.registerFactory<WatchAllAffiliatesUsesCase>(
      () => WatchAllAffiliatesUsesCase());
}
