import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app/api/postapi.dart';
import 'package:flutter_app/theme/colors.dart';
import 'package:flutter_app/model/user.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class NewPost extends StatefulWidget {
  int col;
  int row;

  NewPost({
    required this.col,
    required this.row,
    super.key
  });

  @override
  State<NewPost> createState() => _NewPostState(col: col, row: row);
}

class _NewPostState extends State<NewPost> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _minAgeController = TextEditingController();
  final TextEditingController _maxAgeController = TextEditingController();
  final TextEditingController _minNumController = TextEditingController();
  final TextEditingController _maxNumController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  late DateTime _selectedDate;
  late TimeOfDay _selectedStartDay;
  late TimeOfDay _selectedEndDay;

  final _genders = ['남자만', '여자만', '상관없음'];
  String _selectedGender = '';

  DateTime startTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 9, 00);
  DateTime endTime = DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 21, 00);

  final int col;
  final int row;

  _NewPostState({
    required this.col,
    required this.row
  });

  @override
  void initState() {
    super.initState();

    setState(() {
      _selectedGender = _genders[2];

      _selectedDate = DateTime.now();
      if(col != -1) {
        int weekDiff = (col - _selectedDate.weekday + 7) % 7;
        _selectedDate = _selectedDate.add(Duration(days: weekDiff));

        double time = (row / 2) + 9;
        int hour = time.toInt();
        int minute = (((time * 10) % 10) == 0 ? 0 : 30);

        startTime = DateTime(
            _selectedDate.year, _selectedDate.month, _selectedDate.day, hour, minute);
        endTime = startTime.add(const Duration(minutes: 30));
      }

      _selectedStartDay = const TimeOfDay(hour: 9, minute: 0);
      _selectedEndDay = const TimeOfDay(hour: 10, minute: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: const BoxDecoration(
                color: Color(0xFFFFFFFF),
              ),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(Icons.navigate_before),
                      iconSize: 40,
                    ),
                  ]),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 50,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 15, vertical: 20),
                            child: const Text(
                              '사진',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MAIN_FONT_COLOR),
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              '이름',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MAIN_FONT_COLOR),
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              controller: _nameController,
                            ),
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 80,
                      width:
                          (MediaQuery.of(context).size.width - 50) / 2 - 12.5,
                      decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              '성별',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MAIN_FONT_COLOR),
                            ),
                          ),
                          DropdownButton(
                            value: _selectedGender,
                            items: _genders
                                .map((element) => DropdownMenuItem(
                                      value: element,
                                      child: Text(element),
                                    ))
                                .toList(),
                            onChanged: (value) {
                              setState(() {
                                _selectedGender = value!;
                              });
                            },
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 80,
                          width: (MediaQuery.of(context).size.width - 50) / 2 -
                              12.5,
                          decoration: BoxDecoration(
                              color: SUB_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  '최소\n나이',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: MAIN_FONT_COLOR),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _minAgeController,
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 80,
                          width: (MediaQuery.of(context).size.width - 50) / 2 -
                              12.5,
                          decoration: BoxDecoration(
                              color: SUB_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  '최대\n나이',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: MAIN_FONT_COLOR),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _maxAgeController,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          height: 80,
                          width: (MediaQuery.of(context).size.width - 50) / 2 -
                              12.5,
                          decoration: BoxDecoration(
                              color: SUB_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  '최소\n인원',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: MAIN_FONT_COLOR),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _minNumController,
                                ),
                              )
                            ],
                          )),
                      Container(
                          height: 80,
                          width: (MediaQuery.of(context).size.width - 50) / 2 -
                              12.5,
                          decoration: BoxDecoration(
                              color: SUB_COLOR,
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 15),
                                child: const Text(
                                  '최대\n인원',
                                  style: TextStyle(
                                      fontFamily: 'Pretendard',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600,
                                      color: MAIN_FONT_COLOR),
                                ),
                              ),
                              Expanded(
                                child: TextField(
                                  decoration: const InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                  keyboardType: TextInputType.text,
                                  inputFormatters: <TextInputFormatter>[
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  controller: _maxNumController,
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: 80,
                      decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 15),
                            child: const Text(
                              '시간',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MAIN_FONT_COLOR),
                            ),
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.calendar_today_outlined),
                                onPressed: () async {
                                  final DateTime? dateTime = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: _selectedDate,
                                    lastDate: DateTime(DateTime.now().year, DateTime.now().month + 3),
                                    initialEntryMode: DatePickerEntryMode.calendarOnly,
                                    locale: const Locale('ko', 'KR'),
                                  );
                                  if (dateTime != null) {
                                    setState(() {
                                    });
                                  }
                                },
                              ),
                              Text(
                                  '${_selectedDate.month.toString().padLeft(2, '0')} - ${_selectedDate.day.toString().padLeft(2, '0')}'),
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
                                          initialDateTime: startTime,
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
                                            setState(() {
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
                                          initialDateTime: endTime,
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
                                            setState(() => endTime = newTime);
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
                          )
                        ],
                      )),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      decoration: BoxDecoration(
                          color: SUB_COLOR,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                            child: const Text(
                              '상세설명',
                              style: TextStyle(
                                  fontFamily: 'Pretendard',
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: MAIN_FONT_COLOR),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                              ),
                              keyboardType: TextInputType.text,
                              controller: _descriptionController,
                            ),
                          ),
                        ],
                      )),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(color: Color(0xFFFFFFFF)),
              padding: const EdgeInsets.symmetric(vertical: 40),
              width: MediaQuery.of(context).size.width - 50,
              height: 80 + 40 * 2,
              margin: const EdgeInsets.symmetric(horizontal: 25),
              child: OutlinedButton(
                onPressed: () async {
                  String day = DateFormat("yyyy-MM-dd").format(_selectedDate!);

                  if (_nameController.text.isEmpty ||
                      _minNumController.text.isEmpty ||
                      _maxNumController.text.isEmpty) {
                    return;
                  }

                  Future<bool> isCreate = createPost(
                      _nameController.text,
                      _minAgeController.text == ""
                          ? 0
                          : int.parse(_minAgeController.text),
                      _maxAgeController.text == ""
                          ? 128
                          : int.parse(_maxAgeController.text),
                      _genders.indexOf(_selectedGender) + 1,
                      int.parse(_minNumController.text),
                      int.parse(_maxNumController.text),
                      '${day}T${_selectedStartDay!.hour}:${_selectedStartDay!.minute}:00',
                      '${day}T${_selectedEndDay!.hour}:${_selectedEndDay!.minute}:00',
                      _descriptionController.text,
                      User.tokens.access);

                  if (await isCreate) Navigator.pop(context);
                },
                style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                child: Text(
                  '모임 만들기',
                  style: GoogleFonts.getFont('Inter',
                      fontWeight: FontWeight.w600,
                      fontSize: 20,
                      color: const Color(0xFF000000)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
