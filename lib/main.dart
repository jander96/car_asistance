import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/ui/screens/nav_host.dart';
import 'package:car_assistance/src/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

void main() {
  inject();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: MyAppTheme.light(),
      title: 'My name app',
      initialRoute: "nav_host",
      routes: {"nav_host": (context) => NavHost()},
    );
  }
}
