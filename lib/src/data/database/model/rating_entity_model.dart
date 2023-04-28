import 'package:drift/drift.dart';


class RatingsEntitys extends Table {
  TextColumn get id => text()();
  TextColumn get affiliateId => text()();
  RealColumn get rating => real()();
}
