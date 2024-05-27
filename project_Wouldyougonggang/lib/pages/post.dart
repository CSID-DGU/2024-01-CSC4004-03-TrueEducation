import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/pages/detailedPost.dart';
import 'package:flutter_app/pages/evaluateMain.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'package:flutter_app/widgets/completed_poster.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/widgets/entered_post.dart';
import 'package:flutter_app/widgets/matching_post.dart';
import 'package:flutter_app/widgets/poster.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/theme/colors.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isRecommand = true;
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: BACKGROUND_COLOR,
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0,
            MediaQuery.of(context).padding.bottom),
        width: screenWidth,
        height: screenHeight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // 검색, 추가, 토글버튼 컨테이너
            Container(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              decoration: const BoxDecoration(
                  border: Border(bottom: BorderSide(color: SUB_COLOR))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SearchBar(
                    onSubmitted: (value) {
                      // 검색 결과 입력시 동작(게시글 서버에서 받아오기)
                    },
                    leading: const Icon(Icons.search),
                    hintText: 'search',
                    shape: MaterialStatePropertyAll(ContinuousRectangleBorder(
                        borderRadius: BorderRadius.circular(20))),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRecommand = true;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 40,
                            child: Text(
                              '추천 모임',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: isRecommand ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRecommand = false;
                            });
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 80,
                            height: 40,
                            child: Text(
                              '내 모임',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: isRecommand ? Colors.grey : Colors.black,
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
            CompletedPoster(),
            MatchingPoster(),
            EnteredPoster(),
            Poster(),
          ],
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Container(
          width: 70,
          height: 70,
          child: FloatingActionButton(
            onPressed: () {},
            backgroundColor: PRIMARY_COLOR,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(70)),
            child: const Icon(
              Icons.add,
              color: BACKGROUND_COLOR,
            ),
          ),
        ),
      ),
    );
  }
}
