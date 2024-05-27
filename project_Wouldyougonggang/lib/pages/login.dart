import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/navigation_bar.dart';
import 'package:flutter_app/pages/signup.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: Container(
              padding: EdgeInsets.fromLTRB(
                  0,
                  MediaQuery.of(context).padding.top,
                  0,
                  MediaQuery.of(context).padding.bottom),
              width: screenWidth,
              height: screenHeight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 3,
                    child: Container(
                      height: 400,
                      child: Center(
                        child: Text(
                          'Would You\n공강',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontFamily: 'Pretendard-Regular',
                            fontSize: 60,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Container(
                      height: 300,
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextField(
                              decoration:
                                  InputDecoration(labelText: 'Enter ID'),
                              keyboardType: TextInputType.text,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.fromLTRB(50, 0, 50, 20),
                            child: TextField(
                              decoration: InputDecoration(
                                labelText: 'Enter password',
                              ),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 2,
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(0, 0, 60, 0),
                          alignment: Alignment.bottomRight,
                          child: TextButton(
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => Signup()));
                            },
                            child: Text('회원가입'),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Navigation()));
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
                              width: 280,
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
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
