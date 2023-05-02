import 'package:car_assistance/src/domain/usescases/watch_affiliatess.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/model/affiliate_model.dart';
import '../../widgets/app_bar.dart';
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
     
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const  [
          CustomAppBar()
      
        ],)
    );
  }
}
