import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/daychart.dart';
import 'package:flutter_app/widgets/meeting.dart';

class TimeTable extends StatefulWidget {
  final double height;

  const TimeTable({
    super.key,
    required this.height,
  });

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  List<Meeting> monday = [];

  List<Meeting> tuesday = [];

  List<Meeting> wednesday = [];

  List<Meeting> thursday = [];

  List<Meeting> friday = [];

  List<Meeting> saturday = [];

  List<Meeting> sunday = [];

  void onClicked() {
    setState(
      () {
        print('tapped');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClicked,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          height: widget.height,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 217, 217, 217),
            border: Border.all(
              color: Colors.black,
              width: 0.5,
            ),
          ).copyWith(
            borderRadius: BorderRadius.circular(14),
          ),
          child: SingleChildScrollView(
            child: IntrinsicHeight(
              child: Row(
                children: [
                  Container(
                    alignment: Alignment.center,
                    child: const SizedBox(
                      width: 15,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 18,
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "9",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "10",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "11",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "12",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "13",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "14",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "15",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "16",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "17",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "18",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "19",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "20",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                          Divider(
                            color: Colors.black,
                            height: 1,
                          ),
                          SizedBox(
                            height: 50,
                            child: Center(
                              child: Text(
                                "21",
                                style: TextStyle(fontSize: 12),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 1,
                  ),
                  const Daychart(
                    day: '월',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 1,
                  ),
                  const Daychart(
                    day: '화',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  const Daychart(
                    day: '수',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  const Daychart(
                    day: '목',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  const Daychart(
                    day: '금',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  const Daychart(
                    day: '토',
                  ),
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  const Daychart(
                    day: '일',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
