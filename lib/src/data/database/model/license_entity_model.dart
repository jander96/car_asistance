import 'package:drift/drift.dart';

class LicenseEntitys extends Table {
  TextColumn get id => text()();
  TextColumn get userId => text()();
  TextColumn get freePeriodDateEnd => text()();
  BoolColumn get isPayDone => boolean()();
}
