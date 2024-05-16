import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project_Wouldyougonggang/widgets/meeting.dart';
import 'package:project_Wouldyougonggang/widgets/timetable.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 7,
                ),
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
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
                    SizedBox(
                      height: 10,
                    ),
                    TimeTable(
                      height: 330,
                    ),
                    SizedBox(
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
                            13,
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
                                people: ' 1 / n',
                              ),
                              Meeting(
                                name: '모임 1',
                                explanation: '모임 상세 설명',
                                people: ' 1 / n',
                              ),
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
}
