import 'package:car_assistance/src/data/api/api_service.dart';
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
import 'package:car_assistance/src/data/repositories/user_repository_impl.dart';
import 'package:car_assistance/src/data/services/auth_datasource.dart';
import 'package:car_assistance/src/data/services/auth_datasource_imp.dart';
import 'package:car_assistance/src/data/services/firebase_auth.dart';
import 'package:car_assistance/src/data/services/geolocator_service.dart';
import 'package:car_assistance/src/data/services/key_value_storage_datasource.dart';
import 'package:car_assistance/src/data/services/shared_preference.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/location_repository.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';
import 'package:car_assistance/src/domain/user_repository.dart';
import 'package:car_assistance/src/domain/usescases/create_account.dart';
import 'package:car_assistance/src/domain/usescases/dowload_data_server.dart';
import 'package:car_assistance/src/domain/usescases/get_affiliate_by_id.dart';
import 'package:car_assistance/src/domain/usescases/get_location_use_case.dart';
import 'package:car_assistance/src/domain/usescases/login_user.dart';
import 'package:car_assistance/src/domain/usescases/signout.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiService>(ApiService());
  injector.registerLazySingleton<LocationService>(() => LocationService());
  injector.registerSingleton<FirebaseAuthService>(FirebaseAuthService());

  injector.registerFactory<NetworkDataSource>(() => NetworkDataSourceImpl());
  injector.registerFactory<AffiliateLocalDataSource>(
      () => AffiliateLocalDataSourceImp());
  injector
      .registerFactory<RatingLocalDataSource>(() => RatingLocalDataSourceImp());
  injector.registerLazySingleton<AppDatabase>(() => AppDatabase());
  injector.registerFactory<AuthDataSource>(() => FirebaseAuthDatasource());
  injector.registerSingleton<KeyValueStorageDatasource>( SharedPreferenceService());

  final db = injector.get<AppDatabase>();
  injector.registerLazySingleton<AffiliateDao>(() => AffiliateDao(db));
  injector.registerLazySingleton<RatingDao>(() => RatingDao(db));

  injector.registerFactory<AffiliateRepository>(() => AffiliateRepositoryImp());
  injector.registerFactory<RatingRepository>(() => RatingRepositoryImp());
  injector.registerFactory<LocationRepository>(() => LocationRepositoryImpl());
  
  injector.registerFactory<UserRepository>(() => UserRepositoryImp());

  injector.registerFactory<WatchAllAffiliatesUsesCase>(
      () => WatchAllAffiliatesUsesCase());

  injector.registerFactory<GetAffiliateByIdUseCase>(
      () => GetAffiliateByIdUseCase());

  injector.registerFactory<DowloadDataServerUseCase>(
      () => DowloadDataServerUseCase());

  injector.registerFactory<GetLocationUseCase>(() => GetLocationUseCase());
  injector.registerFactory<LoginUserUseCase>(() => LoginUserUseCase());
  injector.registerFactory<CreateAccountUseCase>(() => CreateAccountUseCase());
  injector.registerFactory<SingOutUseCase>(() => SingOutUseCase());

}
