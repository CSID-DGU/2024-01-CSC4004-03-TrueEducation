import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';
import 'package:flutter_app/service.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  final TextEditingController _userIDController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final TextEditingController _nicknameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthYearController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(color: BACKGROUND_COLOR),
          padding: const EdgeInsets.fromLTRB(25, 25, 20, 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: const InputDecoration(labelText: '아이디'),
                            keyboardType: TextInputType.emailAddress,
                            controller: _userIDController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: '비밀번호'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _passwordController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: '비밀번호 확인'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                            controller: _passwordCheckController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: const InputDecoration(labelText: '닉네임'),
                            keyboardType: TextInputType.text,
                            controller: _nicknameController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: const InputDecoration(labelText: '이름'),
                            keyboardType: TextInputType.text,
                            controller: _usernameController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: '탄생년도'),
                            keyboardType: TextInputType.datetime,
                            controller: _birthYearController,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 100),
                          child: TextField(
                            decoration: const InputDecoration(labelText: '성별'),
                            keyboardType: TextInputType.number,
                            controller: _genderController,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String userID = _userIDController.text.toString();
                            String password =
                                _passwordController.text.toString();
                            String passwordCheck =
                                _passwordCheckController.text.toString();
                            String nickname =
                                _nicknameController.text.toString();
                            String username =
                                _usernameController.text.toString();
                            String birthYear =
                                _birthYearController.text.toString();
                            String gender = _genderController.text.toString();

                            if (password == passwordCheck) {
                              Future<bool> IsSignup = Services.attemptSignup(
                                userID,
                                password,
                                nickname,
                                username,
                                birthYear,
                                gender,
                              );

                              if (await IsSignup) {
                                Navigator.pop(context);
                              }
                            } else {
                              print("${password} ${passwordCheck}");
                            }
                            // 로그인 버튼이 눌렸을 때의 처리
                            // 아이디와 비밀번호를 사용하여 로그인을 시도하고 결과에 따라 처리
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
                            //             builder: (context) => Navigation()),
                            //       );
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
                                  color: SUB_COLOR,
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
                                '가입하기',
                                style: TextStyle(
                                    fontFamily: 'Pretendard',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w500,
                                    color: BUTTON_FONT_COLOR),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                bottom: -68,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Container(
                    width: 273,
                    height: 55,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
