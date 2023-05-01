import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/rating_repository.dart';
import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/affiliate_model.dart';
import 'home_view_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(), child: const _HomeView());
  }
}

class _HomeView extends StatelessWidget {
  const _HomeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final bloc = context.read<HomeCubit>();

    final affiliatesList = injector.get<WatchAllAffiliatesUsesCase>();
    final ratingRepository = injector.get<RatingRepository>();

    ratingRepository.getAllRatings().then((ratingList) {
      for (final rating in ratingList) {
        ratingRepository.storeRatingInDB(rating);
      }
    });

    final rating = ratingRepository.getRatingOfAffiliate("1");

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: affiliatesList.watchAffiliates(),
              builder: (BuildContext context,
                  AsyncSnapshot<List<Affiliate>> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      "el primer servicio de taller es ${snapshot.data != null ? snapshot.data![6].name : "es nullo "}");
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
          FutureBuilder(
            future: rating,
            builder: (BuildContext context, AsyncSnapshot<double> snapshot) {
              return snapshot.data != null
                  ? Text("el rating del primer elemento es ${snapshot.data}")
                  : Text("No hay datos");
            },
          ),
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          bloc.increaseBy(1);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
