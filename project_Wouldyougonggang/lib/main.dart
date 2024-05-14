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
import 'package:flutter_app/pages/timetable.dart';

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
