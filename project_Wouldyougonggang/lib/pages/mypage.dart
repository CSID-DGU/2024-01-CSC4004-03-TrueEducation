import 'dart:async';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
  int mygrade = 1;
  List<int> num = [0, 0, 0, 0, 0, 0];
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
  }

  late Map<String, dynamic>? myEvaluate;

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
                      '현재 ${User.userInfo.username}님의 평가등급은\n${grade[mygrade - 1]}입니다!',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: MAIN_FONT_COLOR),
                    ),
                  ),
                  FutureBuilder<Map<String, dynamic>?>(
                      future: Services.fetchMypage(User.tokens.access),
                      builder: (context, snapshot) {
                        myEvaluate = snapshot.data;

                        if (snapshot.connectionState != ConnectionState.done) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        if (snapshot.hasError) {
                          debugPrint('error${snapshot.error}');
                          return Center(
                            child: Text(snapshot.error.toString()),
                          );
                        }

                        if (myEvaluate != null) {
                          mygrade = myEvaluate!['grade'];
                          num[0] = myEvaluate!['pos_time_num'];
                          num[1] = myEvaluate!['pos_manner_num'];
                          num[2] = myEvaluate!['pos_honor_num'];
                          num[3] = myEvaluate!['pos_ready_num'];
                          num[4] = myEvaluate!['pos_conven_num'];
                          num[5] = myEvaluate!['pos_leadership_num'];

                          return Expanded(child: listviewBuilder());
                        }

                        return const Text('no data found');
                      })
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget listviewBuilder() {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 6,
      itemBuilder: (context, index) {
        return evaluateThing(index);
      },
    );
  }

  Widget evaluateThing(int index) {
    return Container(
      width: MediaQuery.of(context).size.width - 20 * 2,
      height: 60,
      margin: EdgeInsets.fromLTRB(20, 0, 20, 5),
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
