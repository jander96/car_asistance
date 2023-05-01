import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/database/daos/affiliate_dao.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/local_datasource.dart';

class AffiliateLocalDataSourceImp extends AffiliateLocalDataSource {
  final AffiliateDao _affiliateDao;
  AffiliateLocalDataSourceImp() : _affiliateDao = injector.get<AffiliateDao>();

  @override
  Stream<List<AffiliatesEntity>> allAffiliateStream() {
    return _affiliateDao.allAffiliates;
  }

  @override
  Future<int> addAffiliate(AffiliatesEntity affiliate) {
    return _affiliateDao.addAffiliate(affiliate);
  }

  @override
  Future<int> deleteAllAffiliates() {
    return _affiliateDao.cleanAllAffiliates();
  }
}
