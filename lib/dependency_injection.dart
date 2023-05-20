import 'package:car_assistance/src/data/api/api_service.dart';
import 'package:car_assistance/src/data/api/firestore_service.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';
import 'package:car_assistance/src/data/api/network_datasource_imp.dart';
import 'package:car_assistance/src/data/database/daos/affiliate_dao.dart';
import 'package:car_assistance/src/data/database/daos/rating_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/affiliate_local_datasource.dart';
import 'package:car_assistance/src/data/database/affiliate_local_datasource_imp.dart';
import 'package:car_assistance/src/data/database/rating_local_datasource.dart';
import 'package:car_assistance/src/data/database/rating_local_datasource_imp.dart';
import 'package:car_assistance/src/data/repositories/affiliate_repository_imp.dart';
import 'package:car_assistance/src/data/repositories/location_repository_imp.dart';
import 'package:car_assistance/src/data/repositories/rating_repository_imp.dart';
import 'package:car_assistance/src/data/services/geolocator_service.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/location_repository.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';
import 'package:car_assistance/src/domain/usescases/_dowload_data_server.dart';
import 'package:car_assistance/src/domain/usescases/get_affiliate_by_id.dart';
import 'package:car_assistance/src/domain/usescases/get_location_use_case.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerSingleton<FirestoreService>(FirestoreService());
  injector.registerLazySingleton<LocationService>(()=> LocationService());

  injector.registerFactory<NetworkDataSource>(() => NetworkDataSourceImpl());
  injector.registerFactory<AffiliateLocalDataSource>(
      () => AffiliateLocalDataSourceImp());
  injector
      .registerFactory<RatingLocalDataSource>(() => RatingLocalDataSourceImp());
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());

  final db = injector.get<AppDatabase>();
  injector.registerLazySingleton<AffiliateDao>(() => AffiliateDao(db));
  injector.registerLazySingleton<RatingDao>(() => RatingDao(db));

  injector.registerFactory<AffiliateRepository>(() => AffiliateRepositoryImp());
  injector.registerFactory<RatingRepository>(() => RatingRepositoryImp());
  injector.registerFactory<LocationRepository>(() => LocationRepositoryImpl());

  injector.registerFactory<WatchAllAffiliatesUsesCase>(
      () => WatchAllAffiliatesUsesCase());

  injector.registerFactory<GetAffiliateByIdUseCase>(
      () => GetAffiliateByIdUseCase());

  injector.registerFactory<DowloadDataServerUseCase>(
      () => DowloadDataServerUseCase());

  injector.registerFactory<GetLocationUseCase>(() => GetLocationUseCase());
 
}
