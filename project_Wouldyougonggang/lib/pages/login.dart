import 'dart:math';

import 'package:flutter_app/providers/bitmaskings.dart';
import 'package:flutter_app/widgets/variWidget.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/navigation_bar.dart';
import 'package:flutter_app/pages/signup.dart';
import 'package:flutter_app/service.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:provider/provider.dart';
import 'dart:ui';

import 'package:flutter_app/user.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  Timetable? _timetable;
  bool loading = false;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static late User? _user;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).padding.top,
                  0,
                  MediaQuery.of(context).padding.bottom),
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Flexible(
                    flex: 3,
                    child: SizedBox(
                      height: 200,
                      child: Center(
                        child: Text(
                          'Login',
                          style: TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 60,
                              fontWeight: FontWeight.w500,
                              color: MAIN_FONT_COLOR),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: SizedBox(
                      height: 300,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter Email'),
                              keyboardType: TextInputType.emailAddress,
                              controller: _emailController,
                            ),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextField(
                              decoration: const InputDecoration(
                                  labelText: 'Enter password'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: _passwordController,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0, 0, 60, 0),
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: const Text(
                              '회원가입',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: PRIMARY_COLOR),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            // 로그인 버튼이 눌렸을 때의 처리
                            // 아이디와 비밀번호를 사용하여 로그인을 시도하고 결과에 따라 처리

                            String email = _emailController.text.toString();
                            String password =
                                _passwordController.text.toString();

                            Services.attemptLogin(email, password).then(
                              (value) {
                                setState(() {
                                  _user = value;
                                });
                                if (_user != null) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const Navigation()),
                                  );
                                } else {
                                  Fluttertoast.showToast(
                                      msg: "아이디와 비밀번호가 틀렸습니다.");
                                }

                                Services.getUserTimetable(User.tokens.access)
                                    .then((value) {
                                  setState(() {
                                    _timetable = value;
                                    loading = true;

                                    List<String> tmpBitmaskings = [
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                      List.filled(26, '0').join(),
                                    ];

                                    int idx = 0;

                                    for (List<int> i in _timetable!.timetable) {
                                      int temp = 0;
                                      for (int j in i) {
                                        temp |= j;
                                      }
                                      tmpBitmaskings[idx] = temp
                                          .toRadixString(2)
                                          .padLeft(29, '0');

                                      context
                                          .read<Bitmaskings>()
                                          .updateBitmaskings(tmpBitmaskings);

                                      idx++;
                                    }
                                  });
                                });

                                Services.getUserVariation(User.tokens.access)
                                    .then((value) {
                                  setState(() {
                                    for (var item in value!) {
                                      VariWidget variation = VariWidget(
                                        bgColor: Color.fromARGB(
                                          255,
                                          Random().nextInt(256),
                                          Random().nextInt(256),
                                          Random().nextInt(256),
                                        ),
                                        text: item.text,
                                        day: item.day,
                                        time: item.time,
                                      );
                                      context
                                          .read<Bitmaskings>()
                                          .addVariWidget(variation);
                                    }
                                  });
                                });
                              },
                            );

                            // String email = _emailController.text.toString();
                            // String password =
                            //     _passwordController.text.toString();

                            // Services.attemptLogin(email, password).then(
                            //   (value) {
                            //     setState(() {
                            //       _user = value;
                            //     });
                            //     if (_user != null) {
                            //       Navigator.push(
                            //         context,
                            //         MaterialPageRoute(
                            //             builder: (context) =>
                            //                 const Navigation()),
                            //       );
                            //       Fluttertoast.showToast(msg: "로그인 성공!");
                            //     } else {
                            //       Fluttertoast.showToast(
                            //           msg: "아이디와 비밀번호가 틀렸습니다.");
                            //     }
                            //   },
                            // );
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: PRIMARY_COLOR,
                              boxShadow: const [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: 300,
                              height: 60,
                              child: const Text(
                                '로그인',
                                style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
