import 'dart:convert';

import 'package:car_assistance/src/data/api/model/api_model.dart';
import 'package:flutter/services.dart';

class ApiAffiliateService{

  ApiAffiliateService();

  Future<List<AffiliateNetwork>> getAllAffiliates()async{
    final jsonResponse = await rootBundle.loadString("assets/jsons/affiliate_response_example.json");
    final Map<String,dynamic> mapResponse = json.decode(jsonResponse);
    final List<dynamic> listOfAffiliateMap = mapResponse["affiliates"]!;
    final List<AffiliateNetwork> allAffiliates = [];
    for (var affiliateMap in listOfAffiliateMap){
      final affiliate = AffiliateNetwork.fromJson(affiliateMap);
      allAffiliates.add(affiliate);
    }
    return allAffiliates;
  }

}