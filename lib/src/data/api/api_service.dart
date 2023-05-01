import 'dart:convert';

import 'package:car_assistance/src/data/api/model/api_affiliate_model.dart';
import 'package:car_assistance/src/data/api/model/api_rating_model.dart';
import 'package:flutter/services.dart';

class ApiService {
  ApiService();

  Future<List<AffiliateNetwork>> getAllAffiliates() async {
    final jsonResponse = await rootBundle
        .loadString("assets/jsons/affiliate_response_example.json");
    final Map<String, dynamic> mapResponse = json.decode(jsonResponse);
    final List<dynamic> listOfAffiliateMap = mapResponse["affiliates"]!;
    final List<AffiliateNetwork> allAffiliates = [];
    for (var affiliateMap in listOfAffiliateMap) {
      final affiliate = AffiliateNetwork.fromJson(affiliateMap);
      allAffiliates.add(affiliate);
    }
    return allAffiliates;
  }

  Future<List<RatingNetwork>> getAllRatings() async {
    final jsonResponse = await rootBundle
        .loadString("assets/jsons/rating_responde_example.json");
    final Map<String, dynamic> mapResponse = json.decode(jsonResponse);
    final List<dynamic> listOfRatings = mapResponse["ratings"]!;

    final allRatings = <RatingNetwork>[];
    for (final ratingMap in listOfRatings) {
      allRatings.add( RatingNetwork.fromJson(ratingMap));
    }

    return allRatings;
  }

  Future postNewRating(RatingNetwork rating) async {
    // TODO Implementar la funcion que me permita postear un nuevo rating
  }
}