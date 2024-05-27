import 'package:flutter/material.dart';
import 'package:flutter_app/pages/evaluateMain.dart';
import 'package:flutter_app/theme/colors.dart';

class EnteredPoster extends StatelessWidget {
  const EnteredPoster({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => EvaluateMain()));
      },
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 10, 20, 0),
        decoration: const BoxDecoration(
          border: Border(
              bottom: BorderSide(color: SUB_COLOR),
              top: BorderSide(color: SUB_COLOR)),
          color: BACKGROUND_COLOR,
        ),
        child: Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 10, 0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        'assets/images/planets_70593516402.jpeg',
                        fit: BoxFit.cover,
                        width: 60,
                        height: 60,
                      ),
                    ),
                  ),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '모임1',
                        style: TextStyle(fontSize: 18, color: MAIN_FONT_COLOR),
                      ),
                      Text('모임 상세 설명 1/n',
                          style:
                              TextStyle(fontSize: 16, color: SUB_FONT_COLOR)),
                    ],
                  ),
                ],
              ),
              Container(
                width: 60,
                height: 60,
                decoration: BoxDecoration(
                  color: ENTERED_BUTTON_COLOR,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                    child: Text(
                  '완료',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
