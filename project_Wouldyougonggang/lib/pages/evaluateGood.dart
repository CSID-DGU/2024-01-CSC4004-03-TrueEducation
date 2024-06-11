import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/service.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:ui';

class EvaluateGood extends StatefulWidget {
  const EvaluateGood({super.key});

  @override
  State<EvaluateGood> createState() => _EvaluateGoodState();
}

class _EvaluateGoodState extends State<EvaluateGood> {
  List<int> isSelected = [0, 0, 0, 0, 0, 0];
  int trueNum = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 25, 20, 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '어떤 점이 좋았나요?',
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 30,
                          fontWeight: FontWeight.w500,
                          color: MAIN_FONT_COLOR),
                    ),
                    Text(
                      '이 사용자에게 어울리는 키워드를 골라주세요. (1~3개)',
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 15,
                          fontWeight: FontWeight.w300,
                          color: SUB_FONT_COLOR),
                    ),
                  ],
                ),
              ),
              Column(
                children: [
                  templeteContainer('약속 시간을 잘 지켜요', 0),
                  templeteContainer('친절하고 매너가 좋아요', 1),
                  templeteContainer('유쾌해요', 2),
                  templeteContainer('준비성이 좋아요', 3),
                  templeteContainer('편안해요', 4),
                  templeteContainer('리더쉽이 좋아요', 5),
                ],
              ),
              GestureDetector(
                onTap: () async {
                  if (trueNum > 0) {
                    Future<bool> isSubmit = Services.submitEvaluate(
                        1, isSelected); // 1: 평가 대상 member id 넣어줘야함~!
                    if (await isSubmit) Navigator.pop(context);
                  } else {
                    Fluttertoast.showToast(msg: "하나 이상 선택해주세요!");
                  }
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: PRIMARY_COLOR,
                    boxShadow: const [
                      BoxShadow(
                        color: SUB_COLOR,
                        offset: Offset(3, 6),
                        blurRadius: 2,
                      ),
                    ],
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 400,
                    padding: const EdgeInsets.fromLTRB(0, 18.5, 0, 17.5),
                    child: const Text(
                      '제출하기',
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: BUTTON_FONT_COLOR),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget templeteContainer(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (trueNum < 3 && isSelected[index] == 0) {
            isSelected[index] = 1;
            trueNum++;
          } else if (trueNum >= 3 && isSelected[index] == 0) {
            Fluttertoast.showToast(msg: "이미 3개를 고르셨어요!");
          } else if (isSelected[index] == 1) {
            isSelected[index] = 0;
            trueNum--;
          }
        });
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(0, 0, 0, 30),
        child: Container(
          width: 400,
          decoration: BoxDecoration(
            color: isSelected[index] == 1 ? SUB_FONT_COLOR : SUB_COLOR,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(0, 16, 1.8, 16),
            child: Text(
              text,
              style: TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: isSelected[index] == 1
                      ? BUTTON_FONT_COLOR
                      : MAIN_FONT_COLOR),
            ),
          ),
        ),
      ),
    );
  }
}
