import 'package:flutter/material.dart';

class Daychart extends StatelessWidget {
  final String day;

  const Daychart({
    super.key,
    required this.day,
  });

  @override
  Widget build(BuildContext context) {
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
            const SizedBox(
              height: 50,
              // child: Container(
              // 색깔 채워넣기
              // ),
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
            const Divider(
              color: Colors.black,
              height: 1,
            ),
            const SizedBox(
              height: 50,
            ),
          ],
        ),
      ),
    );
  }
}
