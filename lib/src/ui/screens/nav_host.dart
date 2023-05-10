import 'package:car_assistance/dependency_injection.dart';
import 'package:car_assistance/src/domain/usescases/_dowload_data_server.dart';
import 'package:car_assistance/src/ui/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'map/map_page.dart';

class NavHost extends StatefulWidget {
  const NavHost({super.key});

  @override
  State<NavHost> createState() => _NavHostState();
}

class _NavHostState extends State<NavHost> {
  var selectedIndex = 0;
  final bottomNavigationOptions = <int, Widget>{
    0: HomePage(),
    1: MapPage(),
    2: ProfilePage()
  };
  @override
  Widget build(BuildContext context) {
    final downloader = injector.get<DowloadDataServerUseCase>();
    downloader.watchAffiliates();
    return Scaffold(
      body:
          SafeArea(child: bottomNavigationOptions[selectedIndex] ?? HomePage()),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          selectedIndex = value;
          setState(() {
            
          });
        },
        currentIndex: selectedIndex,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: "Map"),
          BottomNavigationBarItem(
              icon: Icon(Icons.account_circle), label: "Account")
        ],
      ),
    );
  }
}
