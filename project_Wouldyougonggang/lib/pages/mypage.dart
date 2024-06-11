import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/service.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/user.dart';

class Mypage extends StatefulWidget {
  const Mypage({super.key});
  @override
  State<Mypage> createState() => _MypageState();
}

class _MypageState extends State<Mypage> {
  int mygrade = 1; // API user evaluate 에서 받아와야 함.
  List<int> num = [0, 0, 0, 0, 0, 0]; // API user evaluate 에서 받아와야 함.
  final List<String> grade = [
    '수성(1단계)',
    '금성(2단계)',
    '지구(3단계)',
    '화성(4단계)',
    '목성(5단계)',
    '토성(6단계)',
    '천왕성(7단계)',
    '해왕성(8단계)',
    '태양(9단계)'
  ];
  final List<String> text = [
    '약속 시간을 잘 지켜요',
    '친절하고 매너가 좋아요',
    '유쾌해요',
    '준비성이 좋아요',
    '편안해요',
    '리더쉽이 좋아요'
  ];
  final List<String> img_src = [
    'assets/images/mercucy.jpg',
    'assets/images/venus.jpg',
    'assets/images/marse.jpg',
    'assets/images/earth.jpg',
    'assets/images/jupiter.jpg',
    'assets/images/saturn.jpg',
    'assets/images/uranus.jpg',
    'assets/images/neptune.jpg',
    'assets/images/sun.jpg',
  ];

  @override
  void initState() {
    super.initState();
    _loadUserData();
  }

  Future<void> _loadUserData() async {
    var data = await Services.fetchMypage(User.tokens.access);
    if (data != null) {
      setState(() {
        mygrade = data['grade'];
        num[0] = data['pos_time_num'];
        num[1] = data['pos_manner_num'];
        num[2] = data['pos_honor_num'];
        num[3] = data['pos_ready_num'];
        num[4] = data['pos_conven_num'];
        num[5] = data['pos_leadership_num'];
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          color: MAIN_FONT_COLOR,
        ),
        child: Column(
          children: [
            SizedBox(
              width: screenWidth,
              height: screenHeight * 0.3,
              child: Image.asset(
                img_src[mygrade],
                fit: BoxFit.fitWidth,
              ),
            ),
            Container(
              width: screenWidth,
              height: screenHeight * 0.70 - 80,
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              decoration: const BoxDecoration(
                color: BACKGROUND_COLOR,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    width: screenWidth - 20 * 2,
                    height: 100,
                    padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                    alignment: Alignment.center,
                    child: Text(
                      '현재 김민수님의 평가등급은\n${grade[mygrade - 1]}입니다!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: MAIN_FONT_COLOR),
                    ),
                  ),
                  for (int i = 0; i < 6; i++) evaluateThing(i),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget evaluateThing(int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 20 * 2,
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: SUB_COLOR,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(
                Icons.person_2_outlined,
                size: 40,
              ),
              Text(
                '${num[index]}',
                style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 26,
                    fontWeight: FontWeight.w500,
                    color: MAIN_FONT_COLOR),
              ),
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width - 100,
            child: Text(
              text[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: MAIN_FONT_COLOR),
            ),
          ),
        ],
      ),
    );
  }
}
