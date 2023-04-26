import 'package:car_assistance/src/data/api/api_affiliate_service.dart';
import 'package:get_it/get_it.dart';

final injector = GetIt.instance;
void inject() {
  injector.registerSingleton<ApiAffiliateService>( ApiAffiliateService());
}
