import 'dart:async';

import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/model/mapper/affiliate_mapper.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';

class ConvertToAffiliate {
  final transformToDomain =
      StreamTransformer<List<AffiliatesEntity>, List<Affiliate>>.fromHandlers(
          handleData: (listOfEntity, sink) {
    final listOfDomain =
        listOfEntity.map((entity) => entity.toDomain()).toList();
    sink.add(listOfDomain);
  });
}
