import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/detailedPost.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'dart:ui';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/api/postapi.dart';
import 'package:flutter_app/user.dart';

import 'evaluateMain.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isRecomend = true;
  bool isMy = false;
  late List<bool> isSelected;

  late PostList? postList;

  late var unitSize;
  late var unitFontSize;

  List<Color> color = [
    ENTERED_BUTTON_COLOR,
    MATCHING_BUTTON_COLOR,
    COMPLETED_BUTTON_COLOR
  ];

  @override
  void initState() {
    isSelected = [isRecomend, isMy];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    unitSize = min(MediaQuery.of(context).size.height / 8,
        MediaQuery.of(context).size.width / 6);
    unitFontSize = unitSize / 100;

    return Scaffold(
      backgroundColor: BACKGROUND_COLOR,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.fromLTRB(0, MediaQuery.of(context).padding.top, 0,
            MediaQuery.of(context).padding.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
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
                              isRecomend = true;
                              isMy = false;
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
                                color: isRecomend ? Colors.black : Colors.grey,
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              isRecomend = false;
                              isMy = true;
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
                                color: isRecomend ? Colors.grey : Colors.black,
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
            FutureBuilder<PostList?>(
                future: fetchPost(isRecomend, User.tokens.access),
                builder: (context, snapshot) {
                  postList = snapshot.data;

                  if (snapshot.connectionState != ConnectionState.done) {
                    debugPrint('connect error');
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }

                  if (snapshot.hasError) {
                    debugPrint('error${snapshot.error}');
                    return Center(
                      child: Text(snapshot.error.toString()),
                    );
                  }

                  if (postList != null) {
                    return Expanded(child: listviewBuilder());
                  }

                  return const Text('no data found');
                })
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
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => NewPost()));
            },
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

  Widget listviewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: postList!.length,
      itemBuilder: (context, index) {
        final PostItem post;

        if (isRecomend) {
          post = (postList!.posts)[index];
        } else {
          final my = postList!.posts;
          final join = postList!.join;
          final wait = postList!.wait;

          final posts = my + join! + wait!;
          posts.sort((a, b) => a.state!.compareTo(b.state!));

          post = posts[index];
        }

        return listviewItem(post);
      },
    );
  }

  Widget listviewItem(PostItem post) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: GestureDetector(
          onTap: () {
            if (isRecomend) {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => DetailedPost(post: post, isRecruit: true,),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))));
            } else if (post.state == 3) {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EvaluateMain(post: post)));
            } else {
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  builder: (context) => DetailedPost(post: post, isRecruit: false,),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))));
            }
          },
          child: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: SUB_FONT_COLOR)),
              ),
              height: unitSize + 20,
              child: postItem(post)),
        ));
  }

  Widget postItem(PostItem post) {
    String stateText;

    if (post.state == 1) {
      stateText = '모집\n중';
    } else if (post.state == 2) {
      stateText = '모집\n완료';
    } else if (post.state == 3) {
      stateText = '모집\n종료';
    } else {
      stateText = '참가';
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          width: unitSize,
          height: unitSize,
          margin: const EdgeInsets.symmetric(horizontal: 10),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/planets_70593516402.jpeg',
                fit: BoxFit.cover,
              )),
        ),
        Container(
          width: MediaQuery.of(context).size.width - (unitSize * 2) - 120,
          margin: const EdgeInsets.symmetric(vertical: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                post.groupName,
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: unitFontSize * 24,
                    fontWeight: FontWeight.w800,
                    color: MAIN_FONT_COLOR),
              ),
              Text(
                '${post.startTime[1]}/${post.startTime[2]}',
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: unitFontSize * 18,
                    fontWeight: FontWeight.w600,
                    color: MAIN_FONT_COLOR),
              ),
              Text(
                '${post.startTime[3]}:${post.startTime[4]} ~ ${post.endTime[3]}:${post.endTime[4]}',
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: unitFontSize * 16,
                    fontWeight: FontWeight.w500,
                    color: MAIN_FONT_COLOR),
              ),
              Text(
                '${post.currentNum} / ${post.maxNum}',
                style: TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: unitFontSize * 12,
                    fontWeight: FontWeight.w400,
                    color: MAIN_FONT_COLOR),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () async {
            if (post.state == null) {
              Future<bool> isApply =
                  applyPost(post.groupId, User.tokens.access);

              if (await isApply) {
                setState(() {});
              }
            }
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: (post.state != null)
                  ? color[(post.state as int) - 1]
                  : GREEN_BUTTON_COLOR,
            ),
            width: unitSize,
            height: unitSize,
            child: Text(
              stateText,
              textAlign: TextAlign.center,
              style: const TextStyle(
                  fontFamily: 'Pretendard',
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: MAIN_FONT_COLOR),
            ),
          ),
        ),
      ],
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isRecomend = true;
      isMy = false;
    } else {
      isRecomend = false;
      isMy = true;
    }
    setState(() {
      isSelected = [isRecomend, isMy];
    });
  }

  void test() {}
}
