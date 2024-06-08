import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

class DetailedPost extends StatelessWidget {
  late var width;
  late var height;

  String name;
  int lowerAge;
  int upperAge;
  int gender;
  int min;
  int max;
  List<String> start;
  List<String> end;
  String? description;
  String? groupGender;

  DetailedPost(
      this.name,
      this.lowerAge,
      this.upperAge,
      this.gender,
      this.min,
      this.max,
      this.start,
      this.end,
      this.description, {super.key}
  );

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height * 4 / 5;

    switch(gender){
      case 1:
        groupGender = "남자만";
        break;
      case 2:
        groupGender = "여자만";
        break;
      default:
        groupGender = "모두";
        break;
    }

    return SizedBox(
      width: double.infinity,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: height / 4,
            width: width,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30)
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  'assets/images/planets_70593516402.jpeg'
                )
              )
            ),
            child: Container(
              margin: EdgeInsets.fromLTRB(10, height / 4 - 50, 10, 10),
              child: Align(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    hashTag("test1"),
                    hashTag("test2test2test2"),
                    hashTag("test3test3"),
                  ],
                ),
              ),
            ),
          ),
          Container(
            height: height * 3 / 4,
            color: const Color(0xFFEEEEEE),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        "모임명 : $name",
                        style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "○ 나이 : $lowerAge ~ $upperAge살",
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            "○ 성별 : $groupGender",
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            "○ 인원 : $min ~ $max명",
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black
                            ),
                          ),
                          Text(
                            "○ 일정 : ${start[1]}/${start[2]} ${start[3]}:${start[4]} ~ ${end[3]}:${end[4]}",
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black
                            ),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                      child: Text(
                        "$description",
                        style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: width - 50,
                  height: 50,
                  margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
                  child: OutlinedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                    ),
                    child: Text(
                      '참가하기',
                      style: GoogleFonts.getFont(
                        'Inter',
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                        color: const Color(0xFF000000)
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget hashTag(String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFFEEEEEE),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
          child: Text(
            '# $text',
            style: GoogleFonts.getFont(
              'Inter',
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
