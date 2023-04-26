import 'package:flutter/material.dart';

import '../../theme/app_theme.dart';
class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Profile")),
      body: Center(child: Text("Profile Page",style: MyAppTheme.darkTextTheme.bodyLarge,)),
    );
  }
}