import 'package:flutter/material.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class EvaluateBad extends StatefulWidget {
  const EvaluateBad({super.key});

  @override
  State<EvaluateBad> createState() => _EvaluateBadState();
}

class _EvaluateBadState extends State<EvaluateBad> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 60),
      body: Container(
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        child: Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 10, 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 25, 0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(62.5),
                        ),
                        child: const SizedBox(width: 125, height: 125),
                      ),
                    ),
                    Container(
                      child: Text(
                        '닉네임',
                        style: TextStyle(
                            fontFamily: 'Pretendard',
                            fontSize: 30,
                            fontWeight: FontWeight.w400,
                            color: MAIN_FONT_COLOR),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 18),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 6, 21, 9),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                          ),
                          child: SizedBox(
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '부정적인 태도',
                            style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: MAIN_FONT_COLOR),
                          ),
                          Text(
                            '고의적으로 모임을 망침',
                            style: TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 20,
                                fontWeight: FontWeight.w400,
                                color: SUB_FONT_COLOR),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 13),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 6, 21, 9),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                          ),
                          child: SizedBox(
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '욕설',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '공격적인 언어 사용',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF989696),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 0, 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(0, 6, 21, 9),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xFFD9D9D9),
                        ),
                        child: SizedBox(
                          width: 35,
                          height: 35,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '노쇼 및 자리 비움',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '모임에 나오지 않거나 자리 비움',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF989696),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 10, 13),
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 6, 21, 9),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFD9D9D9),
                          ),
                          child: SizedBox(
                            width: 35,
                            height: 35,
                          ),
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(0, 0, 0, 2),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                '폭력',
                                style: GoogleFonts.getFont(
                                  'Inter',
                                  fontWeight: FontWeight.w400,
                                  fontSize: 20,
                                  color: Color(0xFF000000),
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '폭력 사용',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF989696),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(10, 0, 17.7, 40),
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xFFD9D9D9),
                  ),
                  child: Container(
                    padding: EdgeInsets.fromLTRB(11, 6.5, 260, 200),
                    child: Text(
                      '상세내용',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF6C69E8),
                  ),
                  child: Container(
                    alignment: Alignment.center,
                    width: 360,
                    padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Text(
                      '제출하기',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 16,
                        color: Color(0xFFFFFFFF),
                      ),
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
}
