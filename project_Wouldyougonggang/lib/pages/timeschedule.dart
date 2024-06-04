// // import 'dart:ffi';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:flutter_app/user.dart';

// import 'package:flutter_app/widgets/schechanges.dart';
// import 'package:flutter_app/widgets/timetable.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:provider/provider.dart';
// import 'package:flutter_app/providers/bitmaskings.dart';
// import '../service.dart';

// class TimeSchedule extends StatefulWidget {
//   TimeTable timetable = TimeTable(
//     height: 380,
//   );
//   List<ScheChanges> ScheChangesList = [];

//   TimeSchedule({super.key});

//   @override
//   State<TimeSchedule> createState() => TimeScheduleState();
// }

// class TimeScheduleState extends State<TimeSchedule> {
//   List<ScheChanges> ScheChangesList = [];

//   late User _user;
//   bool loading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     // Services.fetchUserData(
//     //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE2ODg0NjczLCJpYXQiOjE3MTY4ODI4NzMsImp0aSI6IjNhY2VjYjExY2JkOTRlNmE4ZGU2YTIzYWQwY2I1YjQ2IiwidXNlcl9pZCI6MX0.VIS6RRQKHzgXHhG3nvYKDciE_F9QaTYdTqU_llP7uhQ")
//     //     .then((value) {
//     //   setState(() {
//     //     _user = value;
//     //     loading = true;
//     //   });
//     // });
//   }

//   void LoadTimeTable() {
//     print('tapped');
//   }

//   void removeWidget(Widget widget) {
//     setState(() {
//       ScheChangesList.remove(widget);
//     });
//   }

//   void InputScheChanges() {
//     DateTime selectedDay = DateTime.now();
//     DateTime selectedTime = DateTime(2024, 1, 1, 9, 0);
//     String reason = '';

//     showDialog(
//       context: context,
//       barrierDismissible: false, //외부 터치
//       builder: (BuildContext context) {
//         return StatefulBuilder(
//           builder: (context, setState2) {
//             return AlertDialog(
//               title: const Center(
//                 child: Text("일정 변동 사항"),
//               ),
//               content: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.calendar_today_outlined),
//                         onPressed: () async {
//                           final DateTime? dateTime = await showDatePicker(
//                             context: context,
//                             initialDate: selectedDay,
//                             firstDate: DateTime(
//                                 selectedDay.year,
//                                 selectedDay.month,
//                                 selectedDay.day - (selectedDay.weekday - 1)),
//                             lastDate: DateTime(
//                                 selectedDay.year,
//                                 selectedDay.month,
//                                 selectedDay.day + (7 - selectedDay.weekday)),
//                             initialEntryMode: DatePickerEntryMode.calendarOnly,
//                             locale: const Locale('ko', 'KR'),
//                           );

//                           if (dateTime != null) {
//                             setState2(() {
//                               selectedDay = dateTime;
//                             });
//                           }
//                         },
//                       ),
//                       Text(
//                           '${selectedDay.year} - ${selectedDay.month} - ${selectedDay.day}'),
//                     ],
//                   ),
//                   Row(
//                     children: [
//                       IconButton(
//                         icon: const Icon(Icons.access_time),
//                         onPressed: () async {
//                           // final TimeOfDay? timeOfDay = await showTimePicker(
//                           //   context: context,
//                           //   initialTime: const TimeOfDay(hour: 9, minute: 0),
//                           //   initialEntryMode: TimePickerEntryMode.inputOnly,
//                           // );

//                           // if (timeOfDay != null) {
//                           //   setState2(() {
//                           //     selectedTime = timeOfDay;
//                           //   });
//                           // }
//                           showCupertinoModalPopup<void>(
//                             context: context,
//                             builder: (BuildContext context) => Container(
//                               height: 216,
//                               padding: const EdgeInsets.only(top: 6.0),
//                               // The bottom margin is provided to align the popup above the system
//                               // navigation bar.
//                               margin: EdgeInsets.only(
//                                 bottom:
//                                     MediaQuery.of(context).viewInsets.bottom,
//                               ),
//                               // Provide a background color for the popup.
//                               color: CupertinoColors.systemBackground
//                                   .resolveFrom(context),
//                               // Use a SafeArea widget to avoid system overlaps.
//                               child: SafeArea(
//                                 top: false,
//                                 child: CupertinoDatePicker(
//                                   initialDateTime: selectedTime,
//                                   mode: CupertinoDatePickerMode.time,
//                                   use24hFormat: true,
//                                   // This is called when the user changes the time.
//                                   onDateTimeChanged: (DateTime newTime) {
//                                     setState2(() => selectedTime = newTime);
//                                   },
//                                 ),
//                               ),
//                             ),
//                           );
//                         },
//                       ),
//                       Text(
//                           "${selectedTime.hour.toString().padLeft(2, '0')}:${selectedTime.minute.toString().padLeft(2, '0')}"),
//                     ],
//                   ),
//                   TextField(
//                     controller: TextEditingController(),
//                     decoration: const InputDecoration(
//                       hintText: '사유를 입력해주세요.',
//                       hintStyle: TextStyle(color: Colors.grey),
//                     ),
//                     onChanged: (text) {
//                       reason = text;
//                     },
//                   ),
//                 ],
//               ),
//               actions: [
//                 TextButton(
//                   child: const Text('취소'),
//                   onPressed: () {
//                     Navigator.of(context).pop();
//                   },
//                 ),
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(10.0),
//                       ),
//                       backgroundColor:
//                           const Color.fromARGB(255, 110, 188, 252)),
//                   child: const Text(
//                     '확인',
//                     style: TextStyle(
//                       color: Colors.white,
//                     ),
//                   ),
//                   onPressed: () {
//                     if (reason.isNotEmpty) {
//                       String yoil = '';

//                       setState2(() {
//                         switch (selectedDay.weekday) {
//                           case 1:
//                             yoil = '월';
//                             break;
//                           case 2:
//                             yoil = '화';
//                             break;
//                           case 3:
//                             yoil = '수';
//                             break;
//                           case 4:
//                             yoil = '목';
//                             break;
//                           case 5:
//                             yoil = '금';
//                             break;
//                           case 6:
//                             yoil = '토';
//                             break;
//                           case 7:
//                             yoil = '일';
//                             break;
//                         }
//                       });
//                       setState(() {
//                         ScheChangesList.add(
//                           ScheChanges(
//                             bgColor: const Color.fromARGB(255, 0, 234, 255),
//                             text: reason,
//                             date:
//                                 '${selectedDay.month}/${selectedDay.day} ($yoil)',
//                           ),
//                         );
//                         Navigator.of(context).pop();
//                       });
//                     } else {
//                       ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
//                         content: Text('사유를 입력해주세요!'),
//                         duration: Duration(seconds: 2),
//                       ));
//                     }
//                   },
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Container(
//           padding: const EdgeInsets.symmetric(
//             vertical: 5,
//           ),
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 const SizedBox(
//                   height: 7,
//                 ),
//                 SingleChildScrollView(
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 15,
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.end,
//                           children: [
//                             const Text(
//                               "시간표",
//                               style: TextStyle(
//                                 fontSize: 25,
//                                 fontWeight: FontWeight.w600,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     // 이미지 불러오기
//                                     ImagePicker()
//                                         .pickImage(source: ImageSource.gallery)
//                                         .then((image) {
//                                       if (image != null) {
//                                         setState(() {
//                                           Services.fetchUserTimetable(
//                                                   User.tokens.toString(), image)
//                                               .then((value) {
//                                             setState(() {
//                                               if (value != null) {
//                                                 _user = value;
//                                                 // Do something with _user
//                                                 loading =
//                                                     true; // Assume loading is false when data is successfully loaded
//                                                 List<String> tmpBitmaskings = [
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                   List.filled(26, '0').join(),
//                                                 ];
//                                                 int idx = 0;

//                                                 print(_user.userInfo.timetable);

//                                                 for (List<int> i in _user
//                                                     .userInfo.timetable) {
//                                                   int temp = 0;
//                                                   for (int j in i) {
//                                                     temp |= j;
//                                                   }

//                                                   tmpBitmaskings[idx] = temp
//                                                       .toRadixString(2)
//                                                       .padLeft(29, '0');
//                                                   print(
//                                                       'tempToString$tmpBitmaskings[idx]');

//                                                   context
//                                                       .read<Bitmaskings>()
//                                                       .initBitmaskings(
//                                                           tmpBitmaskings);

//                                                   idx++;
//                                                 }
//                                               } else {
//                                                 // Handle the null case, perhaps by setting an error state or similar
//                                                 loading = false;
//                                                 // Optionally set an error message or take other actions
//                                                 ScaffoldMessenger.of(context)
//                                                     .showSnackBar(
//                                                         const SnackBar(
//                                                   content: Text(
//                                                       'Failed to load timetable'),
//                                                   duration:
//                                                       Duration(seconds: 2),
//                                                 ));
//                                               }
//                                             });
//                                           });
//                                         });
//                                       }
//                                     });
//                                   },
//                                   icon: const Icon(
//                                       Icons.add_photo_alternate_outlined),
//                                   iconSize: 40,
//                                 ),
//                                 IconButton(
//                                   onPressed: InputScheChanges,
//                                   icon: const Icon(
//                                       Icons.drive_file_rename_outline_outlined),
//                                   iconSize: 40,
//                                 ),
//                                 const SizedBox(
//                                   width: 10,
//                                 ),
//                               ],
//                             )
//                           ],
//                         ),
//                       ),
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       widget.timetable,
//                       const SizedBox(
//                         height: 10,
//                       ),
//                       const Padding(
//                         padding: EdgeInsets.only(
//                           left: 15,
//                         ),
//                         child: Text(
//                           "변동 사항",
//                           style: TextStyle(
//                             fontSize: 25,
//                             fontWeight: FontWeight.w600,
//                           ),
//                         ),
//                       ),
//                       for (var scheChange in ScheChangesList) scheChange,
//                     ],
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
