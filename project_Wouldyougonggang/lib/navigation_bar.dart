import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/mypage.dart';
import 'package:flutter_app/pages/post.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 2;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.people_alt),
            label: "Post",
          ),
          NavigationDestination(
            icon: Icon(Icons.calendar_month_outlined),
            label: "Timetable",
          ),
          NavigationDestination(
            icon: Icon(Icons.home_filled),
            label: "Home",
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: "Mypage",
          ),
          // NavigationDestination(
          //   icon: Icon(Icons.settings),
          //   label: "Settings",
          // ),
        ],
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: const [
            Post(),
            Post(),
            Home(),
            Mypage(),
            // Settings(),
          ],
        ),
      ),
    );
  }
}
