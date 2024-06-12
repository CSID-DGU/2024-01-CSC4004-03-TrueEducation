import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/api/postapi.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/evaluateGood.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/user.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class EvaluateMain extends StatefulWidget {
  PostItem post;

  EvaluateMain({super.key, required this.post});

  @override
  State<EvaluateMain> createState() => _EvaluateMainState(post: post);
}

class _EvaluateMainState extends State<EvaluateMain> {
  PostItem post;
  List<Member> members = [];

  _EvaluateMainState({required this.post});

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(color: BACKGROUND_COLOR),
        padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: (MediaQuery.of(context).size.height - 60) * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 20, 0, 20),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            post.groupName,
                            style: const TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 40,
                                fontWeight: FontWeight.w400,
                                color: MAIN_FONT_COLOR),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            post.description,
                            style: const TextStyle(
                                fontFamily: 'Pretendard',
                                fontSize: 25,
                                fontWeight: FontWeight.w400,
                                color: MAIN_FONT_COLOR),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              decoration: const BoxDecoration(
                color: BACKGROUND_COLOR,
                border: Border(
                  bottom: BorderSide(color: MAIN_FONT_COLOR, width: 1),
                ),
              ),
              child: Container(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
                child: const Text(
                  '인원',
                  style: TextStyle(
                      fontFamily: 'Pretendard',
                      fontSize: 32,
                      fontWeight: FontWeight.w500,
                      color: MAIN_FONT_COLOR),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FutureBuilder<MemberList?>(
                        future: getMember(post.groupId, User.tokens.access),
                        builder: (context, snapshot) {
                          members = [];

                          members.add(snapshot.data!.leader);
                          for (Member i in snapshot.data!.member) {
                            members.add(i);
                          }

                          if (snapshot.connectionState !=
                              ConnectionState.done) {
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

                          if (members.isNotEmpty) {
                            return Expanded(child: userList());
                          }

                          return const Text('error');
                        })
                  ]),
            ),
          ],
        ),
      ),
    );
  }

  Widget userList() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: members.length,
        itemBuilder: (context, index) {
          final Member member = members[index];

          return userItem(member);
        });
  }

  Widget userItem(Member member) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 15, 0),
                child: Container(
                  decoration: BoxDecoration(
                    color: SUB_COLOR,
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: const SizedBox(
                    width: 45,
                    height: 45,
                  ),
                ),
              ),
              Text(
                member.name,
                style: const TextStyle(
                    fontFamily: 'Pretendard',
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: MAIN_FONT_COLOR),
              ),
            ],
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                // if (isEvaluated[index] == false) {
                //   isEvaluated[index] = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EvaluateGood(id: member.id,)));
                // }
              });
            },
            child: SizedBox(
              width: 30,
              height: 27.5,
              child: SvgPicture.asset(
                'assets/vectors/vector_5_x2.svg',
                color: Colors.black,
                // color: isEvaluated[index] ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
