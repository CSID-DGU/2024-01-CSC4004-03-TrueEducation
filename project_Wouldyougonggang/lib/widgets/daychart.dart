import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app/providers/bitmaskings.dart';

class Daychart extends StatelessWidget {
  final String day;
  late List<int> bitmasking;

  Daychart({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
    bitmasking = context.watch<Bitmaskings>().getBitmasking(day);

    return Container(
      alignment: Alignment.center,
      child: SizedBox(
        width: 50,
        child: Column(
          children: [
            SizedBox(
              height: 18,
              child: Center(
                child: Text(
                  day,
                  style: const TextStyle(fontSize: 12),
                ),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[0] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[1] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[2] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[3] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[4] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[5] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[6] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[7] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[8] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[9] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[10] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[11] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[12] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[13] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[14] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[15] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[16] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[17] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[18] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[19] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[20] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[21] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[22] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[23] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[24] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
            SizedBox(
              height: 25,
              child: Container(
                color: bitmasking[25] == 0
                    ? Colors.transparent
                    : const Color.fromARGB(255, 45, 45, 45),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
