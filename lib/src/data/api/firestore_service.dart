import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

import 'model/api_affiliate_model.dart';
import 'model/api_rating_model.dart';

class FirestoreService {
  final db = FirebaseFirestore.instance;

  Future<List<AffiliateNetwork>> getAllAffiliates() async {
    try {
      final collections = await db.collection("affiliates").get();

      final listAffiliates = collections.docs
          .map((doc) => AffiliateNetwork.fromJson(doc.id, doc.data()))
          .toList();
      return listAffiliates;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

// ------------------------------------- esto es mockeado---------------------------
    Future<List<RatingNetwork>> getAllRatings() async {
     try {
      final collections = await db.collection("ratings").get();

      final listRatings = collections.docs
          .map((doc) => RatingNetwork.fromJson(doc.id, doc.data()))
          .toList();
      return listRatings;
    } on Exception catch (e) {
      return Future.error(e);
    }
  }

  Future postNewRating(RatingNetwork rating) async {
    // TODO Implementar la funcion que me permita postear un nuevo rating
  }
}
