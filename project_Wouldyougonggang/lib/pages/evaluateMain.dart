import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/evaluateGood.dart';
import 'package:flutter_app/theme/colors.dart';
import 'dart:ui';
import 'package:flutter_svg/flutter_svg.dart';

class EvaluateMain extends StatefulWidget {
  PostItem post;

  EvaluateMain({super.key, required this.post});

  @override
  State<EvaluateMain> createState() => _EvaluateMainState(post: post);
}

class _EvaluateMainState extends State<EvaluateMain> {
  List<bool> isEvaluated = [false, false, false, false, false, false, false];

  PostItem post;

  _EvaluateMainState({required this.post});

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
            SizedBox(
              height: (MediaQuery.of(context).size.height - 60) * 0.55,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    for (int i = 0; i < post.member!.length; i++)
                      userList(i, context),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userList(int index, BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width - 40,
      height: MediaQuery.of(context).size.height * 0.085,
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
                post.member![index].name,
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
                if (isEvaluated[index] == false) {
                  isEvaluated[index] = true;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => EvaluateGood()));
                }
              });
            },
            child: SizedBox(
              width: 30,
              height: 27.5,
              child: SvgPicture.asset(
                'assets/vectors/vector_5_x2.svg',
                color: isEvaluated[index] ? Colors.red : Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
