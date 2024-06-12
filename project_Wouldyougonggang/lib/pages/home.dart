import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/theme/colors.dart';
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
  @override
  Widget build(BuildContext context) {
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
                        "내 모임",
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
                          child: const Column(
                            children: [
                              Meeting(
                                  name: '모임 1',
                                  explanation: '모임 상세 설명',
                                  people: ' 1 / n'),
                              Meeting(
                                  name: '모임 1',
                                  explanation: '모임 상세 설명',
                                  people: ' 1 / n'),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                // const SizedBox(
                //   height: 7,
                // ),
                // Padding(
                //   padding: const EdgeInsets.symmetric(horizontal: 16),
                //   child: Column(
                //     crossAxisAlignment: CrossAxisAlignment.start,
                //     children: [
                //       const Text(
                //         "추천 모임",
                //         style: TextStyle(
                //           fontSize: 25,
                //           fontWeight: FontWeight.w600,
                //         ),
                //       ),
                //       const SizedBox(
                //         height: 5,
                //       ),
                //       Align(
                //         child: Container(
                //           padding: const EdgeInsets.all(
                //             13,
                //           ),
                //           decoration: const BoxDecoration(
                //             color: Color.fromARGB(255, 217, 217, 217),
                //           ).copyWith(
                //             borderRadius: BorderRadius.circular(10),
                //           ),
                //           child: const Column(
                //             children: [
                //               Meeting(
                //                 name: '모임 1',
                //                 explanation: '모임 상세 설명',
                //                 people: ' 1 / n',
                //               ),
                //               Meeting(
                //                 name: '모임 1',
                //                 explanation: '모임 상세 설명',
                //                 people: ' 1 / n',
                //               ),
                //             ],
                //           ),
                //         ),
                //       )
                //     ],
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
