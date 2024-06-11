import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/user.dart';
import 'package:flutter_app/widgets/variWidget.dart';
import 'package:flutter_app/widgets/timetable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';
import 'dart:math';
import 'package:flutter_app/service.dart';

class TimeSchedule extends StatefulWidget {
  TimeTable timetable = TimeTable(
    height: 380,
  );

  TimeSchedule({super.key});

  @override
  State<TimeSchedule> createState() => TimeScheduleState();
}

class TimeScheduleState extends State<TimeSchedule> {
  final _scaffoldKey = GlobalKey<TimeScheduleState>();
  Timetable? _timetable;
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void LoadTimeTable() {
    print('tapped');
  }

  void addVari(VariWidget variation) {
    context.read<Bitmaskings>().addVariWidget(variation);
  }

  void initVariList() {
    context.read<Bitmaskings>().initVariList();
  }

  void InputVariations() {
    DateTime selectedDay = DateTime.now();
    String? yoil;
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
    DateTime startTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 00);
    DateTime endTime = DateTime(
        DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 00);
    String reason = '';
    String variTime = List.filled(26, '1').join();

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
                            });
                          }
                        },
                      ),
                      Text(
                          '${selectedDay.year} - ${selectedDay.month} - ${selectedDay.day} ($yoil)'),
                    ],
                  ),
                  Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.access_time),
                        onPressed: () async {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) => Container(
                              height: 216,
                              padding: const EdgeInsets.only(top: 6.0),
                              // The bottom margin is provided to align the popup above the system
                              // navigation bar.
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              // Provide a background color for the popup.
                              color: CupertinoColors.systemBackground
                                  .resolveFrom(context),
                              // Use a SafeArea widget to avoid system overlaps.
                              child: SafeArea(
                                top: false,
                                child: CupertinoDatePicker(
                                  use24hFormat: true,
                                  initialDateTime: startTime.isAfter(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          20,
                                          30))
                                      ? DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          20,
                                          30)
                                      : startTime.isBefore(DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              9,
                                              00))
                                          ? DateTime(
                                              DateTime.now().year,
                                              DateTime.now().month,
                                              DateTime.now().day,
                                              9,
                                              00)
                                          : startTime,
                                  minimumDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      9,
                                      00),
                                  maximumDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      20,
                                      30),
                                  minuteInterval: 30,
                                  mode: CupertinoDatePickerMode.time,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState2(() {
                                      startTime = newTime;
                                      if (endTime.isBefore(startTime
                                          .add(const Duration(minutes: 30)))) {
                                        endTime = startTime
                                            .add(const Duration(minutes: 30));
                                      }
                                    });
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                          "${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}     ~ "),
                      IconButton(
                        icon: const Icon(Icons.access_time),
                        onPressed: () async {
                          showCupertinoModalPopup<void>(
                            context: context,
                            builder: (BuildContext context) => Container(
                              height: 216,
                              padding: const EdgeInsets.only(top: 6.0),
                              // The bottom margin is provided to align the popup above the system
                              // navigation bar.
                              margin: EdgeInsets.only(
                                bottom:
                                    MediaQuery.of(context).viewInsets.bottom,
                              ),
                              // Provide a background color for the popup.
                              color: CupertinoColors.systemBackground
                                  .resolveFrom(context),
                              // Use a SafeArea widget to avoid system overlaps.
                              child: SafeArea(
                                top: false,
                                child: CupertinoDatePicker(
                                  use24hFormat: true,
                                  initialDateTime: endTime.isAfter(DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          21,
                                          0))
                                      ? DateTime(
                                          DateTime.now().year,
                                          DateTime.now().month,
                                          DateTime.now().day,
                                          21,
                                          0)
                                      : endTime.isBefore(startTime
                                              .add(const Duration(minutes: 30)))
                                          ? startTime
                                              .add(const Duration(minutes: 30))
                                          : endTime,
                                  minimumDate: startTime
                                      .add(const Duration(minutes: 30)),
                                  maximumDate: DateTime(
                                      DateTime.now().year,
                                      DateTime.now().month,
                                      DateTime.now().day,
                                      21,
                                      0),
                                  minuteInterval: 30,
                                  mode: CupertinoDatePickerMode.time,
                                  // This is called when the user changes the time.
                                  onDateTimeChanged: (DateTime newTime) {
                                    setState2(() => endTime = newTime);
                                  },
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                      Text(
                          "${endTime.hour.toString().padLeft(2, '0')}:${endTime.minute.toString().padLeft(2, '0')}"),
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
                    if (reason.isNotEmpty) {
                      setState(() {
                        int startIndex = (startTime.hour - 9) * 2 +
                            (startTime.minute == 30 ? 1 : 0);
                        int endIndex = (endTime.hour - 9) * 2 +
                            (endTime.minute == 30 ? 1 : 0);
                        for (int i = startIndex; i < endIndex; i++) {
                          variTime =
                              '${variTime.substring(0, i)}0${variTime.substring(i + 1)}';
                        }

                        Services.makeUserVariation(User.tokens.access, reason,
                                selectedDay.weekday, variTime)
                            .then((value) {
                          setState(() {
                            _timetable = value;
                            loading = true;

                            List<String> tmpBitmaskings = [
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                              List.filled(26, '0').join(),
                            ];

                            int idx = 0;

                            for (List<int> i in _timetable!.timetable) {
                              int temp = 0;
                              for (int j in i) {
                                temp |= j;
                              }

                              tmpBitmaskings[idx] =
                                  temp.toRadixString(2).padLeft(29, '0');
                              idx++;
                            }
                            _scaffoldKey.currentContext!
                                .read<Bitmaskings>()
                                .updateBitmaskings(tmpBitmaskings);

                            Bitmaskings.variList = [];

                            Services.getUserVariation(User.tokens.access)
                                .then((value) {
                              setState(() {
                                for (var item in value!) {
                                  VariWidget variation = VariWidget(
                                    bgColor: Color.fromARGB(
                                      255,
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                      Random().nextInt(256),
                                    ),
                                    text: item.text,
                                    day: item.day,
                                    time: item.time,
                                  );
                                  addVari(variation);
                                }
                              });
                            });
                          });
                        });

                        Navigator.of(context).pop();
                      });
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text('사유를 입력해주세요!'),
                        duration: Duration(seconds: 2),
                      ));
                    }
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
    return MaterialApp(
      home: Scaffold(
        key: _scaffoldKey,
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
                                    // 이미지 불러오기
                                    ImagePicker()
                                        .pickImage(source: ImageSource.gallery)
                                        .then((image) {
                                      if (image != null) {
                                        setState(() {
                                          Services.makeUserTimetable(
                                                  User.tokens.access, image)
                                              .then((value) {
                                            setState(() {
                                              _timetable = value;
                                              loading = true;

                                              List<String> tmpBitmaskings = [
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                                List.filled(26, '0').join(),
                                              ];

                                              int idx = 0;

                                              for (List<int> i
                                                  in _timetable!.timetable) {
                                                int temp = 0;
                                                for (int j in i) {
                                                  temp |= j;
                                                }
                                                tmpBitmaskings[idx] = temp
                                                    .toRadixString(2)
                                                    .padLeft(29, '0');

                                                context
                                                    .read<Bitmaskings>()
                                                    .updateBitmaskings(
                                                        tmpBitmaskings);

                                                idx++;
                                              }
                                            });
                                          });
                                        });
                                      }
                                    });
                                  },
                                  icon: const Icon(
                                      Icons.add_photo_alternate_outlined),
                                  iconSize: 40,
                                ),
                                IconButton(
                                  onPressed: InputVariations,
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
                      for (var variation
                          in context.read<Bitmaskings>().getVariList)
                        variation,
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
