import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/detailedPost.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/api/postapi.dart';

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

  @override
  void initState(){
    isSelected = [isRecomend, isMy];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    unitSize = min(MediaQuery.of(context).size.height / 8, MediaQuery.of(context).size.width / 6);
    unitFontSize = unitSize / 100;
    
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 120,
                    margin: const EdgeInsets.fromLTRB(25, 20, 5, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF000000),
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 40,
                        ),
                        Container()
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.fromLTRB(5, 20, 25, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost()));
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 45,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(25, 0, 5, 10),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      borderColor: Colors.black,
                      selectedBorderColor: Colors.black,
                      fillColor: const Color(0xFF7f8bf8),
                      isSelected: isSelected,
                      onPressed: toggleSelect,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Text(
                            '추천 모임',
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color(0xFF000000)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Text(
                            '내 모임',
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color(0xFF000000)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(color: Colors.black, thickness: 1),
              )
            ],
          ),
          FutureBuilder<PostList> (
            future: fetchPost(isRecomend),
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
            }
          )
        ],
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
        }
        else {
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
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
      child: GestureDetector(
        onTap: () {
          if(isRecomend){
            showModalBottomSheet(
              context: context,
              isScrollControlled: true,
              builder: (context) => DetailedPost(
                post,
                true
              ),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30)
                )
              )
            );
          }
          else if(post.state == 3) {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EvaluateMain())
            );
          }
          else{
            showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (context) => DetailedPost(
                    post,
                    false
                ),
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30)
                    )
                )
            );
          }
        },
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFF000000),
              width: 1
            ),
            borderRadius: BorderRadius.circular(10)
          ),
          height: unitSize + 20,
          child: postItem(post)
        ),
      )
    );
  }

  Widget postItem(PostItem post) {
    String stateText;

    if(post.state == 1) {stateText = '모집\n중';}
    else if(post.state == 2) {stateText = '모집\n완료';}
    else if(post.state == 3) {stateText = '모집\n종료';}
    else {stateText = '참가';}

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
              )
          ),
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
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w800,
                  fontSize: unitFontSize * 24,
                  color: Colors.black,
                ),
              ),
              Text(
                '${post.startTime[1]}/${post.startTime[2]}',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w600,
                  fontSize: unitFontSize * 18,
                  color: Colors.black,
                ),
              ),
              Text(
                '${post.startTime[3]}:${post.startTime[4]} ~ ${post.endTime[3]}:${post.endTime[4]}',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: unitFontSize * 12,
                  color: Colors.black,
                ),
              ),
              Text(
                '${post.currentNum} / ${post.maxNum}',
                style: GoogleFonts.getFont(
                  'Inter',
                  fontWeight: FontWeight.w400,
                  fontSize: unitFontSize * 12,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () {
            if(post.state == null) applyPost(post.groupId);
          },
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color(0xFFd9d9d9),
            ),
            width: unitSize,
            height: unitSize,
            child: Text(
              stateText,
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
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isRecomend = true;
      isMy = false;
    }
    else {
      isRecomend = false;
      isMy = true;
    }
    setState(() {
      isSelected = [isRecomend, isMy];
    });
  }

  void test() {

  }
}
