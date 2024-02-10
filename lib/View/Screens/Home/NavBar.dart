import 'package:be_health/ViewModel/utils/color.dart';
import 'package:flutter/material.dart';

import '../UserScreens/Diet Plan.dart';
import 'HomePage.dart';
import '../UserScreens/Profile.dart';
import '../UserScreens/goal.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  int currentIndex = 0;

  List pages = [
    const HomePage(),
    const Sessions(),
    const DietPlan(),
    const Profile(),
  ];

  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: NavigationBar(
        animationDuration: const Duration(seconds: 5),
        indicatorColor: Colors.transparent,
        surfaceTintColor: Colors.white,
        backgroundColor: const Color(0xea1a0625),
        selectedIndex: currentIndex,
        onDestinationSelected: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        height: 60,
        destinations: const [
          NavigationDestination(
              selectedIcon: CircleAvatar(
                  radius: 30,
                  backgroundColor: myColor.skipColor,
                  child: Icon(Icons.home, color: myColor.backButton, size: 40)),
              icon: Icon(
                Icons.home,
                color: Colors.white,
                size: 30,
              ),
              label: ''),
          NavigationDestination(
              selectedIcon: CircleAvatar(
                  radius: 30,
                  backgroundColor: myColor.skipColor,
                  child: Icon(Icons.access_alarm,
                      color: myColor.backButton, size: 40)),
              icon: Icon(Icons.access_alarm, color: Colors.white, size: 30),
              label: ''),
          NavigationDestination(
              selectedIcon: CircleAvatar(
                  radius: 30,
                  backgroundColor: myColor.skipColor,
                  child: Icon(Icons.restaurant,
                      color: myColor.backButton, size: 40)),
              icon: Icon(Icons.restaurant_outlined,
                  color: Colors.white, size: 30),
              label: ''),
          NavigationDestination(
              selectedIcon: CircleAvatar(
                  radius: 30,
                  backgroundColor: myColor.skipColor,
                  child:
                      Icon(Icons.person, color: myColor.backButton, size: 40)),
              icon: Icon(Icons.person, color: Colors.white, size: 30),
              label: ''),
        ],
      ),
    );
  }
}
