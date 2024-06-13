import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/postapi.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/detailedPost.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/model/user.dart';
import 'package:flutter_app/widgets/meeting.dart';
import 'package:flutter_app/widgets/timetable.dart';

class Home extends StatefulWidget {
  TimeTable timetable = TimeTable(
    height: 380,
  );
  Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  late PostList? postList;

  late var unitSize;
  late var unitFontSize;

  @override
  Widget build(BuildContext context) {
    unitSize = min(MediaQuery.of(context).size.height / 8,
        MediaQuery.of(context).size.width / 6);
    unitFontSize = unitSize / 100;

    return MaterialApp(
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: BACKGROUND_COLOR,
          padding: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(
                        left: 15,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            "시간표",
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    widget.timetable,
                    const SizedBox(
                      height: 10,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "추천 모임",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Align(
                        child: Container(
                          padding: const EdgeInsets.all(
                            10,
                          ),
                          decoration: const BoxDecoration(
                            color: Color.fromARGB(255, 217, 217, 217),
                          ).copyWith(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Column(
                            children: [
                              FutureBuilder<PostList?>(
                                  future: fetchPost(true, User.tokens.access),
                                  builder: (context, snapshot) {
                                    postList = snapshot.data;

                                    if (snapshot.connectionState != ConnectionState.done) {
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

                                    if (postList != null && postList!.posts.isNotEmpty) {
                                      return Expanded(child: listviewBuilder());
                                    }

                                    return const Text('no data found');
                                  })
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget listviewBuilder() {
    return ListView.builder(
      scrollDirection: Axis.vertical,
      itemCount: min(postList!.length, 2),
      itemBuilder: (context, index) {
        final PostItem post;

        return listviewItem((postList!.posts)[index]);
      },
    );
  }

  Widget listviewItem(PostItem post) {
    return Container(
        margin: const EdgeInsets.fromLTRB(20, 0, 20, 10),
        child: GestureDetector(
          onTap: () {
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => DetailedPost(
                  post: post,
                  isRecruit: true,
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30))));
          },
          child: Container(
              decoration: const BoxDecoration(
                border: Border.symmetric(
                    horizontal: BorderSide(color: SUB_COLOR, width: 2)),
              ),
              height: unitSize + 20,
              child: postItem(post)),
        ));
  }

  Widget postItem(PostItem post) {
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
      ],
    );
  }
}
