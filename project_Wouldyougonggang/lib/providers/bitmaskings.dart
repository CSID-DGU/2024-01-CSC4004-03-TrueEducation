import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/variWidget.dart';

class Bitmaskings with ChangeNotifier {
  static List<String> bitmaskings = [
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
    List.filled(26, '0').join(),
  ];

  static List<VariWidget> variList = [];
  List<VariWidget> get getVariList => variList;

  List<VariWidget> getDayVaris(int col) {
    return variList.where((vari) => vari.day == col - 1).toList();
  }

  String getBitmasking(int col) {
    String bitmasking = List.filled(26, '0').join();

    switch (col) {
      case 1:
        bitmasking = bitmaskings[0];
        break;
      case 2:
        bitmasking = bitmaskings[1];
        break;
      case 3:
        bitmasking = bitmaskings[2];
        break;
      case 4:
        bitmasking = bitmaskings[3];
        break;
      case 5:
        bitmasking = bitmaskings[4];
        break;
      case 6:
        bitmasking = bitmaskings[5];
        break;
      case 7:
        bitmasking = bitmaskings[6];
        break;
    }

    return bitmasking;
  }

  void updateBitmaskings(List<String> newBitmaskings) {
    bitmaskings = newBitmaskings;
    notifyListeners();
  }

  void initVariList() {
    variList = [];
    notifyListeners();
  }

  void addVariWidget(VariWidget widget) {
    variList.add(widget);
    notifyListeners();
  }

  void removeVariWidget(Widget widget) {
    variList.remove(widget);
    notifyListeners();
  }

  void rebuild() {
    notifyListeners();
  }
}
