import 'package:car_assistance/src/ui/screens/login/login_page.dart';
import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'loading_view_model.dart';

class InitLoading extends StatelessWidget {
  const InitLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoadingVieModel(), child: const _LoadingView());
  }
}

class _LoadingView extends StatelessWidget {
  const _LoadingView();

  @override
  Widget build(BuildContext context) {
    
    final viewModel = context.read<LoadingVieModel>();

    return Scaffold(
      body: Center(
        child: FutureBuilder(
          future: viewModel.verifyUserLog(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return  Container();
            } else{
              if (snapshot.data!)return const NavHost();
              return const LoginPage();
            }
          },
        ),
      ),
    );
  }
}
