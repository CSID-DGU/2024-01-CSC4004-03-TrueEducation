import 'package:flutter/material.dart';
import 'package:flutter_app/pages/loading.dart';
import 'package:flutter_app/pages/login.dart';
import 'package:flutter_app/pages/post.dart';
import 'package:flutter_app/pages/evaluateBad.dart';
import 'package:flutter_app/pages/json_parse.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/pages/mypage.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'package:flutter_app/pages/evaluateMain.dart';
import 'package:flutter_app/pages/evaluateMain.dart';
import 'package:flutter_app/pages/evaluateGood.dart';
import 'package:flutter_app/pages/detailedPost.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      home: Scaffold(
        body: Login(),
      ),
    );
  }
}





// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   int _pageIndex = 2;

//   final List _pages = [
//     const Search(),
//     const TimeSchedule(),
//     const Home(),
//     const MyPage(),
//     const Settings(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: _pages[_pageIndex],
//         bottomNavigationBar: BottomNavigationBar(
//             type: BottomNavigationBarType.fixed,
//             currentIndex: _pageIndex,
//             onTap: (value) {
//               setState(() {
//                 _pageIndex = value;
//               });
//             },
//             items: const [
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.people_alt_outlined), label: '검색'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.table_view_rounded), label: '시간표'),
//               BottomNavigationBarItem(icon: Icon(Icons.home_sharp), label: '홈'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.person_outline_rounded), label: '마이페이지'),
//               BottomNavigationBarItem(
//                   icon: Icon(Icons.settings_outlined), label: '설정'),
//             ]),
//       ),
//     );
//   }
// }
