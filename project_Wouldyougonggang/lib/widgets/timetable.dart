import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/daychart.dart';
import 'package:flutter_app/widgets/meeting.dart';

class TimeTable extends StatefulWidget {
  final double height;
  Daychart monChart = Daychart(
    day: '월',
  );
  Daychart tuesChart = Daychart(
    day: '화',
  );
  Daychart wednesChart = Daychart(
    day: '수',
  );
  Daychart thursChart = Daychart(
    day: '목',
  );
  Daychart friChart = Daychart(
    day: '금',
  );
  Daychart saturChart = Daychart(
    day: '토',
  );
  Daychart sunChart = Daychart(
    day: '일',
  );

  TimeTable({
    super.key,
    required this.height,
  });

  @override
  State<TimeTable> createState() => _TimeTableState();
}

class _TimeTableState extends State<TimeTable> {
  void onClicked() {
    setState(
      () {
        print('timetable tapped');
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
                  widget.monChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 1,
                  ),
                  widget.tuesChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  widget.wednesChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  widget.thursChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  widget.friChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  widget.saturChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  widget.sunChart,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
