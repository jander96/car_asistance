import 'package:animate_do/animate_do.dart';
import 'package:car_assistance/src/ui/screens/login/login_view_model.dart';
import 'package:car_assistance/src/ui/screens/login/login_view_state.dart';
import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/formfield_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginViewModel(), child: const _LoginView());
  }
}

class _LoginView extends StatelessWidget {
  const _LoginView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = context.read<LoginViewModel>();
    final state = context.watch<LoginViewModel>().state;
    final emailController = TextEditingController();
    final passwordController = TextEditingController();
    final colors = Theme.of(context).colorScheme;

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 48.0),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const _Header(),
                  _GoogleAccesButton(viewModel: viewModel, state: state),
                  const SizedBox(
                    height: 48,
                  ),
                  _Formulary(
                      emailController: emailController,
                      passwordController: passwordController),
                  _HelperText(viewModel,emailController),
                  _LoginButton(
                      colors: colors,
                      state: state,
                      emailController: emailController,
                      passwordController: passwordController,
                      viewModel: viewModel),
                  if (state.error != null && !state.isLogin)
                    FadeInUp(child: Text('Error ${state.error!.code}')),
                  if (state.isLogin)
                    FadeInUp(
                        child: const Text(
                      'Login success',
                      style: TextStyle(color: Colors.green),
                    ))
                ]),
          ),
        ),
      ),
    );
  }
}

class _LoginButton extends StatelessWidget {
  const _LoginButton({
    required this.colors,
    required this.state,
    required this.emailController,
    required this.passwordController,
    required this.viewModel,
  });

  final ColorScheme colors;
  final LoginViewState state;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final LoginViewModel viewModel;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ButtonStyle(
            overlayColor: MaterialStatePropertyAll(colors.secondary),
            fixedSize: const MaterialStatePropertyAll(Size(274, 43)),
            backgroundColor: MaterialStatePropertyAll(colors.primary)),
        onPressed: state.isLoading && state.error != null
            ? null
            : () {
                final email = emailController.value.text;
                final password = passwordController.value.text;
                viewModel
                    .login(email: email, password: password)
                    .then((isLogin) {
                  if (isLogin) context.pushReplacement('/');
                });
              },
        child: const Text(
          'Login',
          style: TextStyle(color: Colors.black),
        ),
      ),
    );
  }
}

class _HelperText extends StatelessWidget {
  final LoginViewModel viewModel;
  final TextEditingController emailController;
  const _HelperText(this.viewModel, this.emailController);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 104,
      child: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Have you fogotten yuor password?'),
          GestureDetector(
              onTap: () => viewModel.restorePassword(emailController.value.text),
              child: const Text(
                'Restore password',
                style: TextStyle(color: Colors.red),
              )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('or can'),
              const SizedBox(
                width: 8,
              ),
              GestureDetector(
                  onTap: () => context.push('/register'),
                  child: const Text(
                    'Create Account',
                    style: TextStyle(color: Colors.red),
                  )),
            ],
          )
        ],
      )),
    );
  }
}

class _Formulary extends StatelessWidget {
  const _Formulary({
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 48,
          child: FormFieldLogin(
            controller: emailController,
            textInputType: TextInputType.emailAddress,
            hint: 'email',
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        SizedBox(
          height: 48,
          child: FormFieldLogin(
            obscureText: true,
            controller: passwordController,
            textInputType: TextInputType.visiblePassword,
            hint: 'password',
          ),
        ),
      ],
    );
  }
}

class _GoogleAccesButton extends StatelessWidget {
  const _GoogleAccesButton({
    required this.viewModel,
    required this.state,
  });

  final LoginViewModel viewModel;
  final LoginViewState state;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 24.0),
      child: SizedBox(
        height: 48,
        child: OutlinedButton.icon(
            onPressed: () async {
              viewModel.login().then((isLogin) {
                if (isLogin) context.pushReplacement('/');
              });
            },
            icon: state.isLoading
                ? SpinPerfect(
                    infinite: true,
                    child: Image.asset('assets/images/ic_google.png'))
                : Image.asset('assets/images/ic_google.png'),
            label: const Text(
              'Access with google',
              style: TextStyle(color: Colors.black45),
            ),
            style: const ButtonStyle(
                fixedSize: MaterialStatePropertyAll(Size(274, 48)))),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 48.0),
          child: SizedBox(
            width: 160,
            child: Image.asset('assets/images/logo.png'),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Text(
            'Wellcome',
            style: TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
          ),
        ),
      ],
    );
  }
}
