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
  void updateState() {
    setState(() {});
  }

  late Daychart monChart;
  late Daychart tuesChart;
  late Daychart wednesChart;
  late Daychart thursChart;
  late Daychart friChart;
  late Daychart saturChart;
  late Daychart sunChart;

  void onClicked() {
    setState(
      () {
        print('timetable tapped');
      },
    );
  }

  @override
  void initState() {
    monChart = Daychart(
      col: 1,
      updateState: updateState,
    );
    tuesChart = Daychart(
      col: 2,
      updateState: updateState,
    );
    wednesChart = Daychart(
      col: 3,
      updateState: updateState,
    );
    thursChart = Daychart(
      col: 4,
      updateState: updateState,
    );
    friChart = Daychart(
      col: 5,
      updateState: updateState,
    );
    saturChart = Daychart(
      col: 6,
      updateState: updateState,
    );
    sunChart = Daychart(
      col: 7,
      updateState: updateState,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onClicked,
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 11,
          ),
          width: screenWidth,
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
                  monChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 1,
                  ),
                  tuesChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  wednesChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  thursChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  friChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  saturChart,
                  const VerticalDivider(
                    color: Colors.black,
                    width: 0.5,
                  ),
                  sunChart,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
