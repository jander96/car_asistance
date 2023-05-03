import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/affiliate_grid_card.dart';
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
    
    print("Se actualizó vista");

    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomAppBar(
          userName: "Jander",
          userPhotoUrl: "assets/images/jhon_wick.jpg",
          onSubmmit: (p0) {},
          onStatePicked: (p0) {},
        ),
        Expanded(
            child:state.isLoading ? const Center(child:  CircularProgressIndicator()):  _gridView(state.affiliates)),
      ],
    ));
  }

  Widget _gridView(List<Affiliate> affiliates) {
    return GridView.builder(
        itemCount: affiliates.length,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // número de columnas
            mainAxisSpacing: 8.0, // espacio entre filas
            crossAxisSpacing: 8.0,
            childAspectRatio: 0.75 // espacio entre columnas
            ),
        itemBuilder: (context, index) {
          final currentAffiliate = affiliates[index];
          return CustomCard(
              affiliateName: currentAffiliate.name,
              address: currentAffiliate.address,
              rating: currentAffiliate.rating);
        });
  }
}
