import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';

class AffiliateRepositoryImp extends AffiliateRepository {
  final NetworkDataSource _networkDataSource;

  AffiliateRepositoryImp()
      : _networkDataSource = injector.get<NetworkDataSource>();

  @override
  void cleanAllAffiliatesInDb() {
    // TODO: implement cleanAllAffiliatesInDb
  }

  @override
  Stream<List<Affiliate>> getAllAffiliate() {
    // TODO
    throw Exception("No implementada la funcion ");
  }

  @override
  void saveAffiliatesInDb() {
    // TODO: implement saveAffiliatesInDb
  }
}
