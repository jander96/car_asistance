import 'dart:async';

import 'package:car_assistance/src/data/database/drift_database.dart';
import 'package:car_assistance/src/data/database/model/mapper/affiliate_mapper.dart';
import 'package:car_assistance/src/data/services/models/user_mapper.dart';
import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:car_assistance/src/domain/model/app_user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ConvertToAffiliate {
  final transformToDomain =
      StreamTransformer<List<AffiliatesEntity>, List<Affiliate>>.fromHandlers(
          handleData: (listOfEntity, sink) {
    final listOfDomain =
        listOfEntity.map((entity) => entity.toDomain()).toList();
    sink.add(listOfDomain);
  });
}

class ConvertToAppUser {
  final transformToDomain =
      StreamTransformer<User, AppUser>.fromHandlers(
          handleData: (user, sink) {
    final appUser=
        user.toDomain();
    sink.add(appUser);
  });
}

