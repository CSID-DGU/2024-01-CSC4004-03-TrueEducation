import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFFFFFFFF),
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(25, 25, 20, 0),
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 41),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(Icons.navigate_before),
                          iconSize: 40,
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 5.5, 0, 2.5),
                          child: Text(
                            'Would You 공강',
                            style: GoogleFonts.getFont(
                              'Inter',
                              fontWeight: FontWeight.w400,
                              fontSize: 20,
                              color: Color(0xFF000000),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(0, 0, 0, 70),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: InputDecoration(labelText: '아이디'),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: InputDecoration(
                              labelText: '비밀번호',
                            ),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: InputDecoration(labelText: '비밀번호 확인'),
                            keyboardType: TextInputType.text,
                            obscureText: true,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: InputDecoration(labelText: '이름'),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 20),
                          child: TextField(
                            decoration: InputDecoration(labelText: '닉네임'),
                            keyboardType: TextInputType.text,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.fromLTRB(40, 0, 40, 100),
                          child: TextField(
                            decoration: InputDecoration(labelText: '생년월일'),
                            keyboardType: TextInputType.text,
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
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x40000000),
                                  offset: Offset(0, 4),
                                  blurRadius: 2,
                                ),
                              ],
                            ),
                            child: Container(
                              alignment: Alignment.center,
                              width: 290,
                              padding: EdgeInsets.fromLTRB(0, 18.5, 0, 17.5),
                              child: Text(
                                '로그인',
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
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(18, 0, 24, 35),
                  //   child: Column(
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     crossAxisAlignment: CrossAxisAlignment.center,
                  //     children: [
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //               child: Align(
                  //                 alignment: Alignment.topLeft,
                  //                 child: Text(
                  //                   '아이디',
                  //                   style: GoogleFonts.getFont(
                  //                     'Inter',
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16,
                  //                     color: Color(0xFF000000),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFFFFFFF),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Container(
                  //                 width: 273,
                  //                 height: 55,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //               child: Align(
                  //                 alignment: Alignment.topLeft,
                  //                 child: Text(
                  //                   '닉네임',
                  //                   style: GoogleFonts.getFont(
                  //                     'Inter',
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16,
                  //                     color: Color(0xFF000000),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFFFFFFF),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Container(
                  //                 width: 273,
                  //                 height: 55,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //               child: Align(
                  //                 alignment: Alignment.topLeft,
                  //                 child: Text(
                  //                   '비밀번호',
                  //                   style: GoogleFonts.getFont(
                  //                     'Inter',
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16,
                  //                     color: Color(0xFF000000),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFFFFFFF),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Container(
                  //                 width: 273,
                  //                 height: 55,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //               child: Align(
                  //                 alignment: Alignment.topLeft,
                  //                 child: Text(
                  //                   '비밀번호 확인',
                  //                   style: GoogleFonts.getFont(
                  //                     'Inter',
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16,
                  //                     color: Color(0xFF000000),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFFFFFFF),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Container(
                  //                 width: 273,
                  //                 height: 55,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Container(
                  //         margin: EdgeInsets.fromLTRB(0, 0, 0, 35),
                  //         child: Column(
                  //           mainAxisAlignment: MainAxisAlignment.start,
                  //           crossAxisAlignment: CrossAxisAlignment.start,
                  //           children: [
                  //             Container(
                  //               margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //               child: Align(
                  //                 alignment: Alignment.topLeft,
                  //                 child: Text(
                  //                   '이름',
                  //                   style: GoogleFonts.getFont(
                  //                     'Inter',
                  //                     fontWeight: FontWeight.w400,
                  //                     fontSize: 16,
                  //                     color: Color(0xFF000000),
                  //                   ),
                  //                 ),
                  //               ),
                  //             ),
                  //             Container(
                  //               decoration: BoxDecoration(
                  //                 color: Color(0xFFFFFFFF),
                  //                 borderRadius: BorderRadius.circular(10),
                  //               ),
                  //               child: Container(
                  //                 width: 273,
                  //                 height: 55,
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //       Column(
                  //         mainAxisAlignment: MainAxisAlignment.start,
                  //         crossAxisAlignment: CrossAxisAlignment.start,
                  //         children: [
                  //           Container(
                  //             margin: EdgeInsets.fromLTRB(9, 0, 9, 6),
                  //             child: Align(
                  //               alignment: Alignment.topLeft,
                  //               child: Text(
                  //                 '이메일',
                  //                 style: GoogleFonts.getFont(
                  //                   'Inter',
                  //                   fontWeight: FontWeight.w400,
                  //                   fontSize: 16,
                  //                   color: Color(0xFF000000),
                  //                 ),
                  //               ),
                  //             ),
                  //           ),
                  //           Container(
                  //             decoration: BoxDecoration(
                  //               color: Color(0xFFFFFFFF),
                  //               borderRadius: BorderRadius.circular(10),
                  //             ),
                  //             child: Container(
                  //               width: 273,
                  //               height: 55,
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(27, 0, 27, 14),
                  //   child: Align(
                  //     alignment: Alignment.topLeft,
                  //     child: Container(
                  //       child: Text(
                  //         '생년월일',
                  //         style: GoogleFonts.getFont(
                  //           'Inter',
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16,
                  //           color: Color(0xFF000000),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   margin: EdgeInsets.fromLTRB(18, 0, 24, 0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       color: Color(0xFF6C69E8),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Container(
                  //       padding: EdgeInsets.fromLTRB(0, 18.5, 0, 17.5),
                  //       child: Text(
                  //         '회원가입',
                  //         style: GoogleFonts.getFont(
                  //           'Inter',
                  //           fontWeight: FontWeight.w400,
                  //           fontSize: 16,
                  //           color: Color(0xFFFFFFFF),
                  //         ),
                  //       ),
                  //     ),
                  //   ),
                  // ),
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
