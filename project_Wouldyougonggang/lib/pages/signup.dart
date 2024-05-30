import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignUpState();
}

class _SignUpState extends State<Signup> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _passwordCheckController =
      TextEditingController();
  final TextEditingController _nameControll = TextEditingController();
  final TextEditingController _nicknameControll = TextEditingController();
  final TextEditingController _birthControll = TextEditingController();
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
                            decoration: const InputDecoration(labelText: '이메일'),
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
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
                            decoration: const InputDecoration(labelText: '이름'),
                            keyboardType: TextInputType.text,
                            controller: _nameControll,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: const InputDecoration(labelText: '닉네임'),
                            keyboardType: TextInputType.text,
                            controller: _nicknameControll,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.fromLTRB(40, 0, 40, 100),
                          child: TextField(
                            decoration:
                                const InputDecoration(labelText: '탄생년도'),
                            keyboardType: TextInputType.number,
                            controller: _birthControll,
                          ),
                        ),
                        GestureDetector(
                          onTap: () async {
                            String email = _emailController.toString();
                            String password = _passwordController.toString();
                            String passwordCheck =
                                _passwordCheckController.toString();
                            String name = _nameControll.toString();
                            String nickname = _nicknameControll.toString();
                            String birth = _birthControll.toString();

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
