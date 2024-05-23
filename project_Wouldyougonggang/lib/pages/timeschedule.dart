import 'package:flutter/material.dart';

import 'package:flutter_app/widgets/schechanges.dart';
import 'package:flutter_app/widgets/timetable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';

class TimeSchedule extends StatefulWidget {
  TimeTable timetable = TimeTable(
    height: 380,
  );

  TimeSchedule({super.key});

  @override
  State<TimeSchedule> createState() => TimeScheduleState();
}

class TimeScheduleState extends State<TimeSchedule> {
  List<ScheChanges> ScheChangesList = [];

  void LoadTimeTable() {
    print('tapped');
  }

  void removeWidget(Widget widget) {
    setState(() {
      ScheChangesList.remove(widget);
    });
  }

  void InputScheChanges() {
    setState(() {
      showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.fromLTRB(0, 80, 0, 80),
            actions: [
              TextButton(
                child: const Text('확인'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      ScheChangesList.add(const ScheChanges(
        bgColor: Color.fromARGB(255, 0, 234, 255),
        text: '공휴일',
        date: '5/3 (수)',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    List<List<int>> tmpBitmaskings = [
      [
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        0,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        0
      ],
      [
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        1,
        1,
        1,
        1,
        1,
        1,
        0,
        0,
        0,
        0,
        1,
        1,
        0,
        1
      ]
    ];

    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.symmetric(
            vertical: 5,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 7,
                ),
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          left: 15,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            const Text(
                              "시간표",
                              style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    context
                                        .read<Bitmaskings>()
                                        .initBitmaskings(tmpBitmaskings);
                                  },
                                  icon: const Icon(
                                      Icons.add_photo_alternate_outlined),
                                  iconSize: 40,
                                ),
                                IconButton(
                                  onPressed: InputScheChanges,
                                  icon: const Icon(
                                      Icons.drive_file_rename_outline_outlined),
                                  iconSize: 40,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                              ],
                            )
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
                      const Padding(
                        padding: EdgeInsets.only(
                          left: 15,
                        ),
                        child: Text(
                          "변동 사항",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (var ScheChange in ScheChangesList) ScheChange,
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
