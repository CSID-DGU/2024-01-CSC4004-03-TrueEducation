import 'package:flutter/material.dart';
import 'package:flutter_app/pages/mypage.dart';
import 'package:flutter_app/pages/post.dart';

class Navigation extends StatefulWidget {
  const Navigation({super.key});

  @override
  State<Navigation> createState() => _NavigationState();
}

class _NavigationState extends State<Navigation> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (value) => setState(() {
          selectedIndex = value;
        }),
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.people_alt),
            label: "Post",
            selectedIcon: Icon(
              Icons.home,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.calendar_month_outlined),
            label: "Timetable",
            selectedIcon: Icon(
              Icons.search_rounded,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.home_filled),
            label: "Home",
            selectedIcon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.home_filled),
            label: "Mypage",
            selectedIcon: Icon(
              Icons.person,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
          NavigationDestination(
            icon: const Icon(Icons.settings),
            label: "Settings",
            selectedIcon: Icon(
              Icons.settings,
              color: Theme.of(context).colorScheme.onSecondaryContainer,
            ),
          ),
        ],
        animationDuration: const Duration(milliseconds: 500),
      ),
      body: Center(
        child: IndexedStack(
          index: selectedIndex,
          children: [
            Post(),
            Post(), // Timetable
            Post(), // Home
            Mypage(), // Mypage
            Post(), // Settings
          ],
        ),
      ),
    );
  }
}
