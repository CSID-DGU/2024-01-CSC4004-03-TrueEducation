import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';
import 'package:flutter_app/api/service.dart';

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
  String _selectedGender = '3';
  String _passwordError = '';

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
                  Column(
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
                          decoration: const InputDecoration(labelText: '비밀번호'),
                          keyboardType: TextInputType.text,
                          obscureText: true,
                          controller: _passwordController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              decoration:
                                  const InputDecoration(labelText: '비밀번호 확인'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                              controller: _passwordCheckController,
                            ),
                            if (_passwordError.isNotEmpty)
                              Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text(
                                  _passwordError,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                          ],
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
                          decoration: const InputDecoration(
                            labelText: '탄생년도',
                            hintText: '2024-12-25', // 추가된 힌트 텍스트
                          ),
                          keyboardType: TextInputType.datetime,
                          controller: _birthYearController,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              '성별',
                              style: TextStyle(fontSize: 16),
                            ),
                            Row(
                              children: [
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('남'),
                                    value: '1',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('여'),
                                    value: '2',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                                Expanded(
                                  child: RadioListTile<String>(
                                    title: const Text('X'),
                                    value: '3',
                                    groupValue: _selectedGender,
                                    onChanged: (String? value) {
                                      setState(() {
                                        _selectedGender = value!;
                                      });
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          String userID = _userIDController.text.toString();
                          String password = _passwordController.text.toString();
                          String passwordCheck =
                              _passwordCheckController.text.toString();
                          String nickname = _nicknameController.text.toString();
                          String username = _usernameController.text.toString();
                          String birthYear =
                              _birthYearController.text.toString();
                          String gender = _selectedGender;

                          if (password == passwordCheck) {
                            setState(() {
                              _passwordError = '';
                            });

                            Future<bool> isSignup = Services.attemptSignup(
                              userID,
                              password,
                              nickname,
                              username,
                              birthYear,
                              gender,
                            );

                            if (await isSignup) {
                              Navigator.pop(context);
                            }
                          } else {
                            setState(() {
                              _passwordError = '비밀번호가 일치하지 않습니다';
                            });
                          }
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
                ],
              ),
              Positioned(
                bottom: -68,
                child: Container(
                  decoration: BoxDecoration(
                    color: BACKGROUND_COLOR,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const SizedBox(
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
