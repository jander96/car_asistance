import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';

import '../../domain/model/affiliate_model.dart';

class SearchAffiliateDelegate extends SearchDelegate<Affiliate?> {
  final List<Affiliate> affiliates;

  SearchAffiliateDelegate({required this.affiliates});
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      if (query.isNotEmpty)
        FadeIn(
            child: IconButton(
                onPressed: () => query = '', icon: const Icon(Icons.clear)))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () => close(context, null),
        icon: const Icon(Icons.arrow_back_ios_new_rounded));
  }

  @override
  Widget buildResults(BuildContext context) {
    final listOfAffiliates = affiliates
        .where((affiliate) => affiliate.name.contains(query))
        .toList();
    return ListView.builder(
        itemCount: listOfAffiliates.length,
        itemBuilder: (context, index) {
          final affiliate = listOfAffiliates[index];

          return ListTile(
            title: Text(affiliate.name),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final listOfAffiliates = affiliates
        .where((affiliate) => affiliate.name.contains(query))
        .toList();
    return ListView.builder(
        itemCount: listOfAffiliates.length,
        itemBuilder: (context, index) {
          final affiliate = listOfAffiliates[index];

          return ListTile(
            title: Text(affiliate.name),
            subtitle: Text(affiliate.address),
          );
        });
  }
}
