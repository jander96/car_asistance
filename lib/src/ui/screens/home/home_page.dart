import 'package:car_assistance/src/data/api/api_affiliate_service.dart';
import 'package:car_assistance/src/data/api/model/api_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_view_model.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => HomeCubit(),
        child: const _HomeView()
    );
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
    final affiliatesList =  ApiAffiliateService().getAllAffiliates();

    return Scaffold(
      appBar: AppBar(title: Text("Home")),
      body: Center(
          child: FutureBuilder(
              future: affiliatesList,
              builder: (BuildContext context, AsyncSnapshot<List<AffiliateNetwork>> snapshot) {
                if (snapshot.hasData) {
                  return Text("el primer servicio de taller es ${snapshot.data?[0].name ?? "no recibio nada"}");
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const CircularProgressIndicator();
                }
              })),
      floatingActionButton: FloatingActionButton(
        onPressed: () { bloc.increaseBy(1);},
        child: const Icon(Icons.add),
      ),
    );
  }
}
