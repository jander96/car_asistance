
import 'package:drift/drift.dart';

class Affiliates extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get openTime => text()();
  TextColumn get closeTime => text()();
  BoolColumn get isFullTimeService => boolean()();
  TextColumn get phoneNumber => text()();
  RealColumn get rating => real()();
  RealColumn get lat => real()();
  RealColumn get long => real()();
  TextColumn get address => text()();
  TextColumn get services => text()();
}


