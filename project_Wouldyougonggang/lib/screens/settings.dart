import 'package:flutter/material.dart';
import 'package:myapp/widgets/buttonOnSettings.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _MyAppState();
}

class _MyAppState extends State<Settings> {
  bool _isChecked0 = false;
  bool _isChecked1 = false;
  bool _isChecked2 = false;
  bool _isChecked3 = false;
  bool _isChecked4 = false;
  bool _isChecked5 = false;

  String name = "김민수";
  String nickName = "미련곰탱이";
  String sex = "남";
  String birthDay = "2002/07/20";
  bool isInfoOpen = true;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: double.maxFinite,
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 7,
              ),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          "알림 설정",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Container(
                          margin: const EdgeInsets.symmetric(
                            horizontal: 11,
                          ),
                          padding: const EdgeInsets.symmetric(
                            vertical: 21,
                          ),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 217, 217, 217),
                            border: Border.all(
                              color: Colors.black,
                              width: 1,
                            ),
                          ).copyWith(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Align(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 26,
                                    right: 14,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.all(5),
                                        child: Text(
                                          "모든 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 25,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                      Switch(
                                        value: _isChecked0,
                                        onChanged: (value) {
                                          setState(
                                            () {
                                              _isChecked0 = value;
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const Divider(
                                color: Colors.black,
                              ),
                              const SizedBox(height: 20),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          bottom: 3,
                                        ),
                                        child: Text(
                                          "추천 모임 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Switch(
                                      value: _isChecked1,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _isChecked1 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          bottom: 3,
                                        ),
                                        child: Text(
                                          "매칭 완료 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Switch(
                                      value: _isChecked2,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _isChecked2 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          bottom: 3,
                                        ),
                                        child: Text(
                                          "매칭 불발 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Switch(
                                      value: _isChecked3,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _isChecked3 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          bottom: 3,
                                        ),
                                        child: Text(
                                          "모임 시작 1시간 전 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Switch(
                                      value: _isChecked4,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _isChecked4 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(
                                height: 17,
                              ),
                              const SizedBox(height: 10),
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 50,
                                  right: 14,
                                ),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Padding(
                                        padding: EdgeInsets.only(
                                          top: 4,
                                          bottom: 3,
                                        ),
                                        child: Text(
                                          "등급 변동 알림",
                                          style: TextStyle(
                                            color: Colors.black,
                                            fontSize: 22,
                                            fontFamily: 'Inter',
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )),
                                    Switch(
                                      value: _isChecked5,
                                      onChanged: (value) {
                                        setState(
                                          () {
                                            _isChecked5 = value;
                                          },
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 11,
                      ),
                      const SizedBox(
                        height: 37,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 10,
                        ),
                        child: Text(
                          "사용자 정보 변경",
                          style: TextStyle(
                            fontSize: 28,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 17,
                      ),
                      Center(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Color.fromARGB(255, 217, 217, 217),
                          ),
                        ),
                      ),
                      Transform.translate(
                          offset: const Offset(240, -25),
                          child: Transform.scale(
                            scale: 2,
                            child: const Icon(
                              Icons.camera_alt_outlined,
                            ),
                          )),
                      const SizedBox(
                        height: 13,
                      ),
                      SizedBox(
                        width: double.maxFinite,
                        child: Align(
                          alignment: Alignment.center,
                          child: Container(
                            margin: const EdgeInsets.symmetric(
                              horizontal: 11,
                            ),
                            padding: const EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 217, 217, 217),
                              border: Border.all(
                                color: Colors.black,
                                width: 1,
                              ),
                            ).copyWith(
                              borderRadius: BorderRadius.circular(14),
                            ),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                    right: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "성명",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        name,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                    right: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "닉네임",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        nickName,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                    right: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "성별",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        sex,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                    right: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "생년월일",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        birthDay,
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 1,
                                    right: 6,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "정보 공개 여부",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Text(
                                        isInfoOpen ? "예" : "아니오",
                                        style: const TextStyle(
                                          color: Color.fromARGB(
                                              255, 117, 117, 117),
                                          fontSize: 22,
                                          fontFamily: 'Inter',
                                          fontWeight: FontWeight.w400,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 28),
                                Container(
                                  width: 148,
                                  margin: const EdgeInsets.only(left: 1),
                                  child: const Text(
                                    "비밀번호 변경",
                                    maxLines: null,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      const Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            children: [
                              SizedBox(
                                height: 30,
                              ),
                              CustomButton(
                                text: '로그 아웃',
                                bgColor: Color.fromARGB(255, 217, 217, 217),
                                fgColor: Colors.black,
                              ),
                              SizedBox(height: 30),
                              CustomButton(
                                text: '회원 탈퇴',
                                bgColor: Color.fromARGB(255, 255, 38, 23),
                                fgColor: Colors.white,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          /////// Navigation Bar
        ),
      ),
    );
  }
}
