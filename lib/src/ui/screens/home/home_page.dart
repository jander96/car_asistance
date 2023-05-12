import 'package:car_assistance/src/domain/model/affiliate_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../widgets/affiliate_grid_card.dart';
import '../../widgets/app_bar.dart';
import '../../widgets/slider_top_rating.dart';
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

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: CustomScrollView(
          slivers: [
            SliverList(
                delegate: SliverChildBuilderDelegate(
              childCount: 1,
              (context, index) => Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  CustomAppBar(
                    userName: "Jander",
                    userPhotoUrl: "assets/images/jhon_wick.jpg",
                    onSubmmit: (p0) {},
                    onStatePicked: (p0) {},
                    onAvatarTap: () {},
                    onCrowTap: () {},
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SliderAffiliates(affiliate: state.affiliates),
                  SizedBox(
                      height: 220,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _listView(state.affiliates)),
                           SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      height: 220,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _listView(state.affiliates)),
                           SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                      height: 220,
                      child: state.isLoading
                          ? const Center(child: CircularProgressIndicator())
                          : _listView(state.affiliates)),
                  SizedBox(
                    height: 16,
                  )
                ],
              ),
            ))
          ],
        ));
  }

  Widget _listView(List<Affiliate> affiliates) {
    return ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: affiliates.length,
         physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemBuilder: (context, index) {
          final currentAffiliate = affiliates[index];
          return CustomCard(
            affiliate: currentAffiliate,
          );
        });
  }
}
