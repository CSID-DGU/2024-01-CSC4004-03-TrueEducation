import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/evaluateBad.dart';
import 'package:flutter_app/pages/evaluateGood.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EvaluateMain extends StatelessWidget {
  const EvaluateMain({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Container(
          padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 25, 0, 37),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.navigate_before),
                        iconSize: 40,
                      ),
                      SizedBox(
                        width: 32,
                        height: 32,
                        child: SvgPicture.asset(
                          'assets/vectors/image_14_x2.svg',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(6, 0, 0, 0),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(0, 0, 0, 159),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(0.3, 0, 0.3, 37),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              '모임명',
                              style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w400,
                                fontSize: 36,
                                color: const Color(0xFF000000),
                              ),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            '상세설명',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 18,
                              color: const Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(6, 0, 0, 16),
                decoration: const BoxDecoration(
                  color: Color(0xFFFFFFFF),
                  border: Border(
                    bottom: BorderSide(
                      color: Color(0xFF000000),
                      width: 1,
                    ),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.fromLTRB(0, 0, 0, 30),
                  child: Text(
                    '인원',
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 32,
                      color: const Color(0xFF000000),
                    ),
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(10, 0, 2, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                                child: Text(
                                  '유저1',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 74,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateGood()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.5, 16, 0),
                                      width: 30,
                                      height: 27.5,
                                      child: SizedBox(
                                        width: 30,
                                        height: 27.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateBad()));
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: SvgPicture.asset(
                                          'assets/vectors/image_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                                child: Text(
                                  '유저2',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 74,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateGood()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.5, 16, 0),
                                      width: 30,
                                      height: 27.5,
                                      child: SizedBox(
                                        width: 30,
                                        height: 27.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateBad()));
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: SvgPicture.asset(
                                          'assets/vectors/image_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                                child: Text(
                                  '유저3',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 74,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateGood()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.5, 16, 0),
                                      width: 30,
                                      height: 27.5,
                                      child: SizedBox(
                                        width: 30,
                                        height: 27.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateBad()));
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: SvgPicture.asset(
                                          'assets/vectors/image_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                                child: Text(
                                  '유저4',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 74,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateGood()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.5, 16, 0),
                                      width: 30,
                                      height: 27.5,
                                      child: SizedBox(
                                        width: 30,
                                        height: 27.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateBad()));
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: SvgPicture.asset(
                                          'assets/vectors/image_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.fromLTRB(0, 0, 0, 37),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: const Color(0xFFD9D9D9),
                                    borderRadius: BorderRadius.circular(18),
                                  ),
                                  child: const SizedBox(
                                    width: 36,
                                    height: 36,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 3, 0, 4),
                                child: Text(
                                  '유저5',
                                  style: GoogleFonts.getFont(
                                    'Inter',
                                    fontWeight: FontWeight.w400,
                                    fontSize: 24,
                                    color: const Color(0xFF000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(0, 4, 0, 4),
                            child: SizedBox(
                              width: 74,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  EvaluateGood()));
                                    },
                                    child: Container(
                                      margin: const EdgeInsets.fromLTRB(
                                          0, 0.5, 16, 0),
                                      width: 30,
                                      height: 27.5,
                                      child: SizedBox(
                                        width: 30,
                                        height: 27.5,
                                        child: SvgPicture.asset(
                                          'assets/vectors/vector_5_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const EvaluateMain()));
                                    },
                                    child: Container(
                                      margin:
                                          const EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: SizedBox(
                                        width: 28,
                                        height: 28,
                                        child: SvgPicture.asset(
                                          'assets/vectors/image_13_x2.svg',
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
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
      ),
    );
  }
}
