import 'package:drift/drift.dart';

class AffiliatesEntitys extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text()();
  TextColumn get openTime => text().nullable()();
  TextColumn get closeTime => text().nullable()();
  BoolColumn get isFullTimeService => boolean()();
  TextColumn get phoneNumber => text()();
  RealColumn get rating => real()();
  RealColumn get lat => real()();
  RealColumn get long => real()();
  TextColumn get address => text()();
  TextColumn get services => text()();
  TextColumn get state => text()();
}
