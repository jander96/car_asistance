import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/local_datasource.dart';

class LocalDataSourceImp extends LocalDataSource {
  AppDatabase db;
  LocalDataSourceImp() : db = injector.get<AppDatabase>();

  @override
  Stream<List<AffiliatesEntity>> allAffiliateStream() {
    return db.allAffiliates;
  }

  @override
  Future<int> addAffiliate(AffiliatesEntity affiliate) {
    return db.addAffiliate(affiliate);
  }

  @override
  void deleteAllAffiliates() {
    db.cleanAllAffiliates();
  }
}
