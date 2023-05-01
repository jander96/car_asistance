import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:drift/drift.dart';

import '../model/affiliate_entity_model.dart';

part 'affiliate_dao.g.dart';

@DriftAccessor(tables: [AffiliatesEntitys])
class AffiliateDao extends DatabaseAccessor<AppDatabase>
    with _$AffiliateDaoMixin {
  AffiliateDao(AppDatabase db) : super(db);

  Stream<List<AffiliatesEntity>> get allAffiliates =>
      select(affiliatesEntitys).watch();

  Future<int> addAffiliate(AffiliatesEntity affiliate) {
    return into(affiliatesEntitys).insert(affiliate);
  }

  Future<int> cleanAllAffiliates() {
    return delete(affiliatesEntitys).go();
  }

  Future<List<AffiliatesEntity>> getBestRating(int top) {
    final result = select(affiliatesEntitys)
      ..orderBy(
          [(t) => OrderingTerm(expression: t.rating, mode: OrderingMode.desc)])
      ..limit(top);
    return result.get();
  }
}
