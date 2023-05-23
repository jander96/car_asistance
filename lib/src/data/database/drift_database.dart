import 'package:drift/drift.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:drift/native.dart';
import 'model/affiliate_entity_model.dart';
import 'model/license_entity_model.dart';
import 'model/rating_entity_model.dart';
import 'model/user_entity_model.dart';
part 'drift_database.g.dart';

@DriftDatabase(tables: [AffiliatesEntitys, RatingsEntitys,UserEntitys,LicenseEntitys])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());
  @override
  int get schemaVersion => 1;
  
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, "app_database.sqlite"));
    return NativeDatabase(file);
  });
}
