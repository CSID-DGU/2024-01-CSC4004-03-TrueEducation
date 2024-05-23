import 'package:flutter/material.dart';

class Bitmaskings with ChangeNotifier {
  List<List<int>> _bitmaskings = [
    List.filled(26, 0),
    List.filled(26, 0),
    List.filled(26, 0),
    List.filled(26, 0),
    List.filled(26, 0),
    List.filled(26, 0),
    List.filled(26, 0),
  ];

  List<int> getBitmasking(String day) {
    List<int> bitmasking = List.filled(26, 0);

    switch (day) {
      case '월':
        bitmasking = _bitmaskings[0];
        break;
      case '화':
        bitmasking = _bitmaskings[1];
        break;
      case '수':
        bitmasking = _bitmaskings[2];
        break;
      case '목':
        bitmasking = _bitmaskings[3];
        break;
      case '금':
        bitmasking = _bitmaskings[4];
        break;
      case '토':
        bitmasking = _bitmaskings[5];
        break;
      case '일':
        bitmasking = _bitmaskings[6];
        break;
    }

    return bitmasking;
  }

  void initBitmaskings(List<List<int>> newBitmasking) {
    _bitmaskings = newBitmasking;
    notifyListeners();
  }
}
