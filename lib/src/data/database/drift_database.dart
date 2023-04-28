import 'package:drift/drift.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'model/affiliate_entity_model.dart';
import 'model/rating_entity_model.dart';
part 'drift_database.g.dart';

@DriftDatabase(tables: [AffiliatesEntitys, RatingsEntitys])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  //Stream de affiliate
  Stream<List<AffiliatesEntity>> get allAffiliates =>
      select(affiliatesEntitys).watch();
  // insert New affiliate
  Future<int> addAffiliate(AffiliatesEntity affiliate) {
    return into(affiliatesEntitys).insert(affiliate);
  }

  void cleanAllAffiliates() {
   delete(affiliatesEntitys);
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "app_database.sqlite"));
    return NativeDatabase(file);
  });
}
