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
  const _HomeView();

  @override
  Widget build(BuildContext context) {
    final state = context.watch<HomeCubit>().state;
    final viewModel = context.read<HomeCubit>();
    viewModel.loadAffiliates();
    final stream = WatchAllAffiliatesUsesCase().watchAffiliates();

    return Scaffold(
      appBar: AppBar(title: const Text("Home")),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder(
              stream: state.streamOfAffiliates,
              builder: (BuildContext context,
                  AsyncSnapshot<List<Affiliate>> snapshot) {
                if (snapshot.hasData) {
                  return Text(
                      "el primer servicio de taller es ${snapshot.data != null ? snapshot.data![1].name : "es nullo "} y su rating es ${snapshot.data![1].rating}");
                } else if (snapshot.hasError) {
                  return const Icon(Icons.error_outline);
                } else {
                  return const CircularProgressIndicator();
                }
              }),
        ],
      )),
    );
  }
}
