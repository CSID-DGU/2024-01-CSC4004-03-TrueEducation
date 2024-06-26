import 'package:flutter/material.dart';
import 'package:flutter_app/pages/timeschedule.dart';
import 'package:flutter_app/providers/bitmaskings.dart';
import 'package:provider/provider.dart';

class VariWidget extends StatefulWidget {
  final Color bgColor;
  final String text;
  final int day;
  final String time;

  const VariWidget(
      {super.key,
      required this.bgColor,
      required this.text,
      required this.day,
      required this.time});

  @override
  State<VariWidget> createState() => _VariWidgetState();
}

class _VariWidgetState extends State<VariWidget> {
  void removeWidget() {
    // 여기서 context를 사용하지 않고 bitmaskings를 사용합니다.
    setState(() {
      context.read<Bitmaskings>().removeVariWidget(widget);
    });
  }

  @override
  Widget build(BuildContext context) {
    late String yoil;
    late int startIdx;
    late int endIdx;

    switch (widget.day) {
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

    bool flag = false;
    for (int i = 0; i < widget.time.length; i++) {
      if (!flag && widget.time[i] == '0') {
        startIdx = i;
        flag = true;
      }
      if (flag && widget.time[i] == '1') {
        endIdx = i;
        break;
      }
    }
    int startHour = 9 + (startIdx ~/ 2);
    int startMin = (startIdx % 2) * 30;
    int endHour = 9 + (endIdx ~/ 2);
    int endMin = (endIdx % 2) * 30;

    return Column(
      children: [
        InkWell(
          onTap: () {},
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Container(
                  width: 324,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 5,
                    ),
                    child: Row(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: widget.bgColor,
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "($yoil)",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Column(
                              children: [
                                Text(
                                    "${startHour.toString().padLeft(2, '0')}:${startMin.toString().padLeft(2, '0')}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                                Text(
                                    "${endHour.toString().padLeft(2, '0')}:${endMin.toString().padLeft(2, '0')}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    )),
                              ],
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Text(
                              widget.text,
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 22,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: removeWidget,
                icon: const Icon(Icons.cancel_outlined),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        )
      ],
    );
  }
}
