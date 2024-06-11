import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_app/user.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../api/postapi.dart';
import '../model/postmodel.dart';

class DetailedPost extends StatelessWidget {
  late var width;
  late var height;

  PostItem post;
  late String groupGender;
  bool isRecruit;

  DetailedPost(this.post, this.isRecruit, {super.key});

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height * 4 / 5;

    switch (post.groupGender) {
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
                    topRight: Radius.circular(30)),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image:
                        AssetImage('assets/images/planets_70593516402.jpeg'))),
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
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Text(
                        "모임명 : ${post.groupName}",
                        style: GoogleFonts.getFont('Inter',
                            fontWeight: FontWeight.w800,
                            fontSize: 24,
                            color: Colors.black),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "○ 나이 : ${post.minNum} ~ ${post.maxNum}살",
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            "○ 성별 : $groupGender",
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            "○ 인원 : ${post.minAge} ~ ${post.maxAge}명",
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          ),
                          Text(
                            "○ 일정 : ${post.startTime[1]}/${post.startTime[2]} ${post.startTime[3]}:${post.startTime[4]} ~ ${post.endTime[3]}:${post.endTime[4]}",
                            style: GoogleFonts.getFont('Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                                color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 25, vertical: 10),
                      child: Text(
                        post.description,
                        style: GoogleFonts.getFont('Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            color: Colors.black),
                      ),
                    ),
                  ],
                ),
                memberList(),
                recruit(context)
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

  Widget recruit(BuildContext context) {
    if (isRecruit) {
      return Container(
        width: width - 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: OutlinedButton(
          onPressed: () async {
            Future<bool> isApply = applyPost(post.groupId, User.tokens.access);
            if (await isApply) Navigator.pop(context);
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          ),
          child: Text(
            '참가하기',
            style: GoogleFonts.getFont('Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF000000)),
          ),
        ),
      );
    }
    return Container();
  }

  Widget memberList() {
    if (post.member != null && post.member!.isNotEmpty) {
      return Container(
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '승인 대기',
              style: GoogleFonts.getFont('Inter',
                  fontWeight: FontWeight.w800,
                  fontSize: 24,
                  color: Colors.black),
            ),
            Container(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.vertical,
                itemCount: post.member!.length,
                itemBuilder: (context, index) {
                  if (post.member![index].state == 1) {
                    return memberItem(post.member![index]);
                  }
                },
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }

  Widget memberItem(Member member) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: 50,
            height: 50,
            child: Image.asset('assets/images/person.png'),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              member.nickname,
              style: GoogleFonts.getFont('Inter',
                  fontWeight: FontWeight.w500,
                  fontSize: 18,
                  color: Colors.black),
            ),
          ),
          GestureDetector(
            onTap: () {},
            child: Container(
              decoration: const BoxDecoration(
                color: Color(0xFFEEEEEE),
              ),
              child: Text('수락'),
            ),
          )
        ],
      ),
    );
  }
}
