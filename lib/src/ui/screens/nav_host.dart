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
    0: const HomePage(),
    1: const MapPage(),
    2: const ProfilePage()
  };
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body:
          SafeArea(child: bottomNavigationOptions[selectedIndex] ?? const HomePage()),
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
