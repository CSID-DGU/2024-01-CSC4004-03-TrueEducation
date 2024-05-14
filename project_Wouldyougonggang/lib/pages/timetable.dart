import 'package:flutter/material.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class Timetable extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFFD9D9D9),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: EdgeInsets.fromLTRB(0, 149.5, 0, 148.5),
        child: Text(
          '시간표 이미지',
          style: GoogleFonts.getFont(
            'Inter',
            fontWeight: FontWeight.w400,
            fontSize: 18,
            color: Color(0xFF000000),
          ),
        ),
      ),
    );
  }
}
