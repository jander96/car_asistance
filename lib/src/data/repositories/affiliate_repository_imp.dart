import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/database/local_datasource.dart';
import 'package:car_assistance/src/data/database/model/mapper/affiliate_mapper.dart';
import 'package:car_assistance/src/data/repositories/stream_transformer.dart';
import 'package:car_assistance/src/domain/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';


class AffiliateRepositoryImp extends AffiliateRepository {
  final NetworkDataSource _networkDataSource;
  final LocalDataSource _localDataSource;

  AffiliateRepositoryImp()
      : _networkDataSource = injector.get<NetworkDataSource>(),
        _localDataSource = injector.get<LocalDataSource>();

  @override
  Stream<List<Affiliate>> watchAffiliates() {
    final transformer = ConvertToAffiliate().transformToDomain;
    return _localDataSource.allAffiliateStream().transform(transformer);
  }

  @override
  Future<List<Affiliate>> getAllAffiliate() {
    return _networkDataSource.getAllAffiliate().then((listOfAffiliateNetwork) =>
        listOfAffiliateNetwork.map((network) => network.toDomain()).toList());
  }

  @override
  void saveAffiliatesInDb(Affiliate affiliate) {
    final affiliateEntity = affiliatesEntityfromDomain(affiliate);
    _localDataSource.addAffiliate(affiliateEntity);
  }

  @override
  void cleanAllAffiliatesInDb() {
    _localDataSource.deleteAllAffiliates();
  }


}
