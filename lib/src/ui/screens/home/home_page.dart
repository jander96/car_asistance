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
    final textStyles = Theme.of(context).textTheme;
    final viewModel = context.read<HomeCubit>();
    final affiliates = state.affiliates;

    return Scaffold(
        backgroundColor: Colors.blueGrey,
        body: state.isLoading
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: [
                  SliverList(
                      delegate: SliverChildBuilderDelegate(
                    childCount: 1,
                    (context, index) => Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomAppBar(
                          userName: state.user?.username,
                          userPhotoUrl: state.user?.photoURL,
                          affiliates: affiliates,
                          onSubmmit: (p0) {},
                          onStatePicked: (value) {
                            if (value != null) {
                              viewModel.filter(value);
                              
                            }
                          },
                          onAvatarTap: () {
                            debugPrint('tap to avatar');
                          },
                          onCrowTap: () {
                            debugPrint('tap to crown');
                          },
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SliderAffiliates(affiliate: affiliates),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, bottom: 2),
                          child: Text(
                            'All',
                            style: textStyles.displaySmall!
                                .copyWith(decoration: TextDecoration.underline),
                          ),
                        ),
                        SizedBox(height: 220, child: _listView(affiliates)),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, bottom: 2),
                          child: Row(
                            children: [
                              Text('Filtred by state',
                                  style: textStyles.displaySmall!.copyWith(
                                      decoration: TextDecoration.underline)),

                                      Spacer(),

                                  Padding(
                                    padding: const EdgeInsets.only(right: 24.0),
                                    child: ElevatedButton(
                                      
                                      onPressed: (){},
                                       child: state.stateSelected != null ? Text(state.stateSelected!): const Text('State no selected')),
                                  )
                            ],
                          ),
                        ),
                        state.filtredAffiliates.isEmpty
                            ? Padding(
                                padding: const EdgeInsets.only(
                                    left: 32.0, bottom: 2),
                                child:
                                    Text("No service avalible"),
                              )
                            : SizedBox(
                                height: 220,
                                child: _listView(state.filtredAffiliates)),
                        const SizedBox(
                          height: 16,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 24.0, bottom: 2),
                          child: Text('Favorites',
                              style: textStyles.displaySmall!.copyWith(
                                  decoration: TextDecoration.underline)),
                        ),
                        SizedBox(height: 220, child: _listView(affiliates)),
                        const SizedBox(
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
