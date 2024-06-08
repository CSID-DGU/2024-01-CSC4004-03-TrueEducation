import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/evaluateBad.dart';
import 'package:flutter_app/pages/evaluateGood.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluateMain extends StatelessWidget {
  List<String> member = ['hi', 'I am', 'team', '6', 'swim', 'real', 'edu'];
  String title = '모임명';
  String description = '상세설명';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: const BoxDecoration(color: BACKGROUND_COLOR),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: (MediaQuery.of(context).size.height - 60) * 0.3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            title,
                            style: const TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: MAIN_FONT_COLOR),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          description,
                          style: const TextStyle(
                              fontFamily: 'Pretendard',
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: MAIN_FONT_COLOR),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                  decoration: const BoxDecoration(
                    color: BACKGROUND_COLOR,
                    border: Border(
                      bottom: BorderSide(color: MAIN_FONT_COLOR, width: 1),
                    ),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                    child: const Text(
                      '인원',
                      style: TextStyle(
                          fontFamily: 'Pretendard',
                          fontSize: 32,
                          fontWeight: FontWeight.w500,
                          color: MAIN_FONT_COLOR),
                    ),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < member.length; i++)
                      userList(i, context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget userList(int index, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height * 0.08,
      // decoration: BoxDecoration(color: Colors.amber),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: SUB_COLOR,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const SizedBox(
                    width: 40,
                    height: 40,
                  ),
                ),
              ),
              Text(
                member[index],
                style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: MAIN_FONT_COLOR),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => EvaluateGood()));
            },
            child: SizedBox(
              width: 30,
              height: 27.5,
              child: SvgPicture.asset('assets/vectors/vector_5_x2.svg'),
            ),
          ),
        ],
      ),
    );
  }
}
