import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
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
                          onPressed: () {},
                          icon: Image.asset('assets/images/ic_google.png'),
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
                    child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('email'),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            hintText: 'email')),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    height: 48,
                    child: TextFormField(
                        decoration: const InputDecoration(
                            label: Text('password'),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4))),
                            hintText: 'password')),
                  ),
                  SizedBox(
                    height: 104,
                    
                  ),
                  SizedBox(
                    height: 48,
                    child: ElevatedButton(
                      style: const ButtonStyle(
                          fixedSize: MaterialStatePropertyAll(Size(274, 43)),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.red)),
                      onPressed: () {
                        context.pushReplacement('/');
                      },
                      child: const Text(
                        'Create Account',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  )
                ]),
          ),
        ),
      ),
    );
  }
}
