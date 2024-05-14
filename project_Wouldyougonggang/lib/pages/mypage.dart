import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Mypage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: 420,
        decoration: BoxDecoration(
          color: Color(0xFF1F1F1F),
        ),
        child: Column(
          children: [
            Container(
              width: 420,
              height: 250,
              child: Image.network(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQXTOsQ0gWAEPfpXnA1fFyBuqEwysc3VHMZpQ&s',
                fit: BoxFit.fill,
              ),
            ),
            Container(
              width: 420,
              height: 560,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10)),
              ),
              child: Column(
                children: [
                  Container(
                    width: 380,
                    height: 80,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Color(0xFF000000)),
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xFFFFFFFF),
                    ),
                    child: Text(
                      '현재 김민수님의 평가등급은\n\'지구(7단계)\'입니다! (등급별 설명)',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  Container(
                    width: 380,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              '3',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '약속 시간을 잘 지켜요',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              '5',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '친절하고 매너가 좋아요',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              '3',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '유쾌해요',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              '3',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '준비성이 좋아요',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 380,
                    height: 60,
                    margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color.fromARGB(255, 245, 245, 245),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.person_2_outlined,
                              size: 40,
                            ),
                            Text(
                              '3',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Color(0xFF000000),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          width: 300,
                          child: Text(
                            '편안해요',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xFF000000),
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
