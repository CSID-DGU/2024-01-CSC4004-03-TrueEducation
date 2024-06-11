import 'package:flutter/material.dart';
import 'package:flutter_app/pages/home.dart';
import 'package:flutter_app/pages/timeschedule.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';
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
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => Bitmaskings()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      home: Scaffold(
        body: ChangeNotifierProvider(
          create: (BuildContext context) => Bitmaskings(),
          child:
              const Login(), //테스트 시 이 화면 설정 변경!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
        ),
      ),
      theme: ThemeData(fontFamily: 'Pretendard'),
      themeMode: ThemeMode.system,
    );
  }
}
