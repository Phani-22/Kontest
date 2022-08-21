import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:kontest/pages/home_page.dart';
import 'package:kontest/pages/upcoming_contests_page.dart';
import 'package:kontest/pages/website_category_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> screens = const [
    HomePage(),
    UpcomingContestsPage(),
    CategoryPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFc5e5f3).withOpacity(0.9),
      backgroundColor: Colors.white.withOpacity(0.9),
      body: SafeArea(
        child: IndexedStack(
          index: selectedIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 5, right: 15),
        child: GNav(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 25),
          gap: 10,
          selectedIndex: selectedIndex,
          activeColor: Colors.purple.shade600,
          tabBackgroundColor: Colors.purple.shade200,
          rippleColor: Colors.purple.shade100,
          onTabChange: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          tabs: const [
            GButton(icon: Icons.home, text: "Home"),
            GButton(icon: Icons.favorite_border, text: "Saved"),
            GButton(icon: Icons.search, text: "Search"),
          ],
        ),
      ),
    );
  }
}
