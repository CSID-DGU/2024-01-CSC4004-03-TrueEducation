import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/user.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';

import '../api/postapi.dart';
import '../model/postmodel.dart';

class DetailedPost extends StatefulWidget {
  bool isRecruit;
  PostItem post;

  DetailedPost({
    super.key,
    required this.post,
    required this.isRecruit
  });

  @override
  State<DetailedPost> createState() => _DetailedState(isRecruit: isRecruit, post: post);
}

class _DetailedState extends State<DetailedPost> {
  late var width;
  late var height;

  late String groupGender;

  bool isRecruit;
  PostItem post;

  _DetailedState({
    required this.post,
    required this.isRecruit
  });

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
            color: SUB_COLOR,
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
                            "○ 나이 : ${post.minAge} ~ ${post.maxAge}살",
                            style: GoogleFonts.getFont(
                                'Inter',
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
                            "○ 인원 : ${post.minNum} ~ ${post.maxNum}명",
                            style: GoogleFonts.getFont(
                                'Inter',
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
          color: SUB_COLOR,
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
    else if(post.state == 1 && post.currentNum >= post.minNum && post.member != null) {
      return Container(
        width: width - 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: OutlinedButton(
          onPressed: () async {
            Future<bool> isChanged = changeState(post.groupId, User.tokens.access);
            if(await isChanged) {
              setState(() {});
            }
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          child: Text(
            '모임 시작',
            style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF000000)
            ),
          ),
        ),
      );
    }
    else if(post.state == 2 && post.member != null) {
      return Container(
        width: width - 50,
        height: 50,
        margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
        child: OutlinedButton(
          onPressed: () async {
            Future<bool> isChanged = changeState(post.groupId, User.tokens.access);
            if(await isChanged) {
              setState(() {});
            }
          },
          style: OutlinedButton.styleFrom(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10)
            ),
          ),
          child: Text(
            '모임 종료',
            style: GoogleFonts.getFont(
                'Inter',
                fontWeight: FontWeight.w500,
                fontSize: 20,
                color: const Color(0xFF000000)
            ),
          ),
        ),
      );
    }
    return Container();
  }

  Widget memberList() {
    if(post.member != null) {
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
              height: 150,
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

  final List<String> grade = [
    '수성(1단계)',
    '금성(2단계)',
    '지구(3단계)',
    '화성(4단계)',
    '목성(5단계)',
    '토성(6단계)',
    '천왕성(7단계)',
    '해왕성(8단계)',
    '태양(9단계)'
  ];

  Widget memberItem(Member member) {
    return Container(
      height: height / 10,
      margin: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          Container(
            width: height / 13,
            height: height / 13,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              border: Border.all(
                color: Colors.black,
                style: BorderStyle.solid,
                width: 0.1
              )
            ),
            child: SvgPicture.asset(
              'assets/vectors/person.svg',
            ),
          ),
          Expanded(
            child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        member.nickname,
                        style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            color: Colors.black
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        grade[member.grade - 1],
                        style: GoogleFonts.getFont(
                            'Inter',
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                            color: Colors.black
                        ),
                      ),
                    )
                  ],
                ),
              ),
              GestureDetector(
                onTap: () async {
                  Future<bool> isAccept = acceptMember(post.groupId, member.id, User.tokens.access);

                  if(await isAccept) {
                    setState(() {

                    });
                  }
                },
                child: Container(
                  width: width / 5,
                  height: height / 13,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xCCBFFF00),
                    border: Border.all(
                      color: Colors.black,
                      style: BorderStyle.solid,
                      width: 0.7
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 5,
                        offset: const Offset(2, 2), // changes position of shadow
                      ),
                    ]
                  ),
                  child: Text(
                    '수락',
                    textAlign: TextAlign.center,
                    style: GoogleFonts.getFont(
                      'Inter',
                      fontWeight: FontWeight.w400,
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                ),
              )
            ],
          )
          )
        ],
      ),
    );
  }
}
