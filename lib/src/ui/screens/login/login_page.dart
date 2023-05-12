import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          
         crossAxisAlignment: CrossAxisAlignment.center,
          
          children: [
            SizedBox(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.only(top: 80 ),
                child: Image.asset('assets/images/logo.png'),
              ),
            ),
           const SizedBox(
            height: 120,
             child:  Padding(
               padding:  EdgeInsets.only(top: 48 ),
                child: Text('Wellcome',style: TextStyle(fontSize: 48,fontWeight: FontWeight.w400),),
              ),
           ),
            SizedBox(
              height: 48,
              child: OutlinedButton.icon(
                onPressed: () {},
                icon: Image.asset('assets/images/ic_google.png'),
                label: const Text('Access with google',style: TextStyle(color: Colors.black45),),
                style: const ButtonStyle(textStyle:MaterialStatePropertyAll(TextStyle(fontSize: 12)) ,
                  fixedSize: MaterialStatePropertyAll(Size(274,43))
                  )),
            ),

            SizedBox(
              height: 91,
              child: Padding(
                padding: const EdgeInsets.only(left: 32,right: 32,top: 32),
                child: TextFormField(
                  decoration: const InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: 'email' 
                     )),
              ),
            ),
            SizedBox(
              height: 91,
              child: Padding(
                padding: const EdgeInsets.only(left: 32,right: 32,top: 8),
                child: TextFormField(
                  
                  decoration: const InputDecoration(
                     border: OutlineInputBorder(),
                     hintText: 'password' 
                     )),
              ),
            ),
            SizedBox(
              height: 80,
              child: Padding(
                padding: const EdgeInsets.only(left: 32,right: 32,top: 32),
                child: ElevatedButton(style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(274,43)) ),
                          onPressed: () {
                context.pushReplacement('/');
                          },
                          child: Text('Login'),
                        ),
              ),
            )
        ]),
      ),
    );
  }
}
