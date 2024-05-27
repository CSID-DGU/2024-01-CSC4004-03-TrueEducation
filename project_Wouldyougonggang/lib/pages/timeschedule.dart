import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/user.dart';

import 'package:flutter_app/widgets/schechanges.dart';
import 'package:flutter_app/widgets/timetable.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';
import '../service.dart';

class TimeSchedule extends StatefulWidget {
  TimeTable timetable = TimeTable(
    height: 380,
  );
  List<ScheChanges> ScheChangesList = [];

  TimeSchedule({super.key});

  @override
  State<TimeSchedule> createState() => TimeScheduleState();
}

class TimeScheduleState extends State<TimeSchedule> {
  List<ScheChanges> ScheChangesList = [];

  User _user = User(pk: 0, email: "");
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.fetchUserData(
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE1MTgwNzI1LCJpYXQiOjE3MTUxNzg5MjUsImp0aSI6IjhhMDgzYWU2ZDU3ZjQwOTE5ZWE2ODcyMzYyYmE0M2QxIiwidXNlcl9pZCI6NX0.NaukW9EnxExbQeHaRtHollRNdMXxRBEL-cQfbfzVtX0")
        .then((value) {
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  void LoadTimeTable() {
    print('tapped');
  }

  void removeWidget(Widget widget) {
    setState(() {
      ScheChangesList.remove(widget);
    });
  }

  void InputScheChanges() {
    DateTime selectedDay = DateTime.now();
    String reason = '';

    showDialog(
      context: context,
      barrierDismissible: false, //외부 터치
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState2) {
            return AlertDialog(
              title: const Center(
                child: Text("일정 변동 사항"),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.calendar_today_outlined),
                        onPressed: () async {
                          final DateTime? dateTime = await showDatePicker(
                            context: context,
                            initialDate: selectedDay,
                            firstDate: DateTime(
                                selectedDay.year,
                                selectedDay.month,
                                selectedDay.day - (selectedDay.weekday - 1)),
                            lastDate: DateTime(
                                selectedDay.year,
                                selectedDay.month,
                                selectedDay.day + (7 - selectedDay.weekday)),
                            initialEntryMode: DatePickerEntryMode.calendarOnly,
                            locale: const Locale('ko', 'KR'),
                          );

                          if (dateTime != null) {
                            setState2(() {
                              selectedDay = dateTime;
                              print(selectedDay);
                            });
                          }
                        },
                      ),
                      Text(
                          '${selectedDay.year} - ${selectedDay.month} - ${selectedDay.day}'),
                    ],
                  ),
                  TextField(
                    controller: TextEditingController(),
                    decoration: const InputDecoration(
                      hintText: '사유를 입력해주세요.',
                      hintStyle: TextStyle(color: Colors.grey),
                    ),
                    onChanged: (text) {
                      reason = text;
                    },
                  ),
                ],
              ),
              actions: [
                TextButton(
                  child: const Text('취소'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      backgroundColor:
                          const Color.fromARGB(255, 110, 188, 252)),
                  child: const Text(
                    '확인',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      if (reason.isNotEmpty) {
                        String yoil = '';
                        switch (selectedDay.weekday) {
                          case 1:
                            yoil = '월';
                            break;
                          case 2:
                            yoil = '화';
                            break;
                          case 3:
                            yoil = '수';
                            break;
                          case 4:
                            yoil = '목';
                            break;
                          case 5:
                            yoil = '금';
                            break;
                          case 6:
                            yoil = '토';
                            break;
                          case 7:
                            yoil = '일';
                            break;
                        }

                        ScheChangesList.add(
                          ScheChanges(
                            bgColor: const Color.fromARGB(255, 0, 234, 255),
                            text: reason,
                            date:
                                '${selectedDay.month}/${selectedDay.day} ($yoil)',
                          ),
                        );
                        Navigator.of(context).pop();
                      } else {
                        ScaffoldMessenger.of(context)
                            .showSnackBar(const SnackBar(
                          content: Text('사유를 입력해주세요!'),
                          duration: Duration(seconds: 2),
                        ));
                      }
                    });
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // List<List<int>> tmpBitmaskings = [
    //   [
    //     0,
    //     1,
    //     1,
    //     1,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     0
    //   ],
    //   [
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     1,
    //     0,
    //     0,
    //     0,
    //     0,
    //     1,
    //     1,
    //     0,
    //     1
    //   ]
    // ];

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
                                        .initBitmaskings(_user.calendar!);
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
                      for (var scheChange in ScheChangesList) scheChange,
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
