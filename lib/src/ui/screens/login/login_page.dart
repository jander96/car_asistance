import 'package:animate_do/animate_do.dart';
import 'package:car_assistance/src/ui/screens/login/login_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../widgets/formfield_login.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginViewModel(), child: _LoginView());
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
                      style:
                          TextStyle(fontSize: 38, fontWeight: FontWeight.w400),
                    ),
                  ),
                  Padding(
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
                                  child: Image.asset(
                                      'assets/images/ic_google.png'))
                              : Image.asset('assets/images/ic_google.png'),
                          label: const Text(
                            'Access with google',
                            style: TextStyle(color: Colors.black45),
                          ),
                          style: const ButtonStyle(
                              fixedSize:
                                  MaterialStatePropertyAll(Size(274, 48)))),
                    ),
                  ),
                  const SizedBox(
                    height: 48,
                  ),
                  SizedBox(
                    height: 48,
                    child: FormFieldLogin(
                      controller: emailController,
                      hint: 'email',
                      onSubmit: (p0) {},
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    child: FormFieldLogin(
                      controller: passwordController,
                      hint: 'password',
                      onSubmit: (p0) {},
                    ),
                  ),
                  SizedBox(
                    height: 104,
                    child: Center(
                        child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Do you have an account?'),
                        GestureDetector(
                            onTap: () => context.push('/register'),
                            child: const Text('Create Account',style: TextStyle(color: Colors.red),))
                      ],
                    )),
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        overlayColor: MaterialStatePropertyAll(colors.secondary),
                          fixedSize: const MaterialStatePropertyAll(Size(274, 43)),
                          backgroundColor:
                              MaterialStatePropertyAll(colors.primary)),
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
                  ),
                  if (state.error != null) Text('Error ${state.error!.code}')
                ]),
          ),
        ),
      ),
    );
  }
}
