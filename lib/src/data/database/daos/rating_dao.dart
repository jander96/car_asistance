import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:drift/drift.dart';

import '../model/rating_entity_model.dart';

part 'rating_dao.g.dart';

@DriftAccessor(tables: [RatingsEntitys])
class RatingDao extends DatabaseAccessor<AppDatabase> with _$RatingDaoMixin {
  RatingDao(AppDatabase db) : super(db);
}
