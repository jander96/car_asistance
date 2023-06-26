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

class ConvertToString {
  static final transformToString =
      StreamTransformer<List<Favorite>, List<String>>.fromHandlers(
          handleData: (listOfEntity, sink) {
    final listOfString =
        listOfEntity.map((entity) => entity.affiliateId).toList();
    sink.add(listOfString);
  });
}

