import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'package:flutter_app/widgets/variWidget.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';

class Daychart extends StatelessWidget {
  final int col;
  late String bitmasking;
  late List<VariWidget> varis;

  Daychart({
    super.key,
    required this.col,
  });

  @override
  Widget build(BuildContext context) {
    bitmasking = context.watch<Bitmaskings>().getBitmasking(col);
    varis = context.watch<Bitmaskings>().getDayVaris(col);
    //String mergedVariTime = List.filled(26, '1').join();
    //List<Color> bgColorList = [];
    // if (varis.isNotEmpty) {
    //   for (var item in varis) {
    //     int temp1 = int.parse(mergedVariTime, radix: 2);
    //     int temp2 = int.parse(item.time, radix: 2);
    //     int result = temp1 & temp2;
    //     mergedVariTime = result.toRadixString(2);
    //   }
    //   // for(var i in mergedVariTime.split('')) {

    //   // }
    // }
    var width = MediaQuery.of(context).size.width - 14 * 2 - 15;

    String? day;
    switch (col) {
      case 1:
        day = '월';
        break;
      case 2:
        day = '화';
        break;
      case 3:
        day = '수';
        break;
      case 4:
        day = '목';
        break;
      case 5:
        day = '금';
        break;
      case 6:
        day = '토';
        break;
      case 7:
        day = '일';
        break;
    }

    Widget box(int row) {
      return GestureDetector(
        onTap: () {
          if (bitmasking[row] == '0') {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewPost(col: col, row: row)));
          } else {
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text('해당 시간은 모임을 생성할 수 없습니다!'),
              duration: Duration(seconds: 2),
            ));
          }
        },
        child: Column(
          children: [
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[row] == '0'
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            if (row % 2 == 1)
              const Divider(
                color: Colors.black,
                height: 1,
              ),
          ],
        ),
      );
    }

    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: width / 7,
        child: Column(
          children: [
            SizedBox(
              height: 18,
              child: Center(
                child: Text(
                  day!,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            for (int i = 0; i < 26; i++) box(i),
          ],
        ),
      ),
    );
  }
}
