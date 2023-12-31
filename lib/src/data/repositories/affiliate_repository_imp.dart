import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/database/datasource/affiliate_local_datasource.dart';
import 'package:car_assistance/src/data/database/model/mapper/affiliate_mapper.dart';
import 'package:car_assistance/src/data/database/model/mapper/stream_transformer.dart';
import 'package:car_assistance/src/domain/repositories/affiliate_repository.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/data/api/network_datasource.dart';

class AffiliateRepositoryImp extends AffiliateRepository {
  final NetworkDataSource _networkDataSource;
  final AffiliateLocalDataSource _localDataSource;

  AffiliateRepositoryImp()
      : _networkDataSource = injector.get<NetworkDataSource>(),
        _localDataSource = injector.get<AffiliateLocalDataSource>();

  @override
  Stream<List<Affiliate>> watchAffiliates() {
    final transformer = ConvertToAffiliate().transformToDomain;
    return _localDataSource.allAffiliateStream().transform(transformer);
  }

  @override
  Future<List<Affiliate>> getAllAffiliate() {
    return _networkDataSource
        .getAllAffiliate()
        .then((listOfAffiliateNetwork) => listOfAffiliateNetwork.map((network) {
              final affiliateDomain = network.toDomain();
              return affiliateDomain;
            }).toList());
  }

  @override
  Future<int> saveAffiliatesInDb(Affiliate affiliate) {
    final affiliateEntity = affiliatesEntityfromDomain(affiliate);
    affiliateEntity;
    return _localDataSource.addAffiliate(affiliateEntity);
  }

  @override
  Future<int> cleanAllAffiliatesInDb() {
    return _localDataSource.deleteAllAffiliates();
  }

  @override
  Stream<List<Affiliate>> getBestRating(int top) {
    final transformer = ConvertToAffiliate().transformToDomain;
    return _localDataSource.getBestRating(top).transform(transformer);
  }

  @override
  Future<Affiliate> getAffiliateById(String id) {
    return _localDataSource
        .getAffiliateById(id)
        .then((value) => value.toDomain());
  }
}
