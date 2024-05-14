import 'package:flutter/material.dart';
import 'package:project_Wouldyougonggang/screens/TimeSchedule.dart';
import 'package:project_Wouldyougonggang/screens/home.dart';
import 'package:project_Wouldyougonggang/screens/mypage.dart';
import 'package:project_Wouldyougonggang/screens/search.dart';
import 'package:project_Wouldyougonggang/screens/settings.dart';

void main() {
  runApp(const project_Wouldyougonggang());
}

class project_Wouldyougonggang extends StatefulWidget {
  const project_Wouldyougonggang({super.key});

  @override
  State<project_Wouldyougonggang> createState() =>
      _project_WouldyougonggangState();
}

class _project_WouldyougonggangState extends State<project_Wouldyougonggang> {
  int _pageIndex = 2;

  final List _pages = [
    const Search(),
    const TimeSchedule(),
    const Home(),
    const MyPage(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: _pages[_pageIndex],
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: _pageIndex,
            onTap: (value) {
              setState(() {
                _pageIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.people_alt_outlined), label: '검색'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.table_view_rounded), label: '시간표'),
              BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: '홈'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_outline_rounded), label: '마이페이지'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: '설정'),
            ]),
      ),
    );
  }
}
