import 'package:drift/drift.dart';


class Ratings extends Table {
  TextColumn get id => text()();
  TextColumn get affiliateId => text()();
  RealColumn get rating => real()();
}
