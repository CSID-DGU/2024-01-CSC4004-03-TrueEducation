import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  List<List<int>> timetable;

  User({required this.timetable});

  // JSON 데이터를 Timetable 객체로 변환하는 factory constructor
  factory User.fromJson(Map<String, dynamic> json) {
    // JSON의 timetable 문자열을 List<List<int>>로 변환
    List<dynamic> timetableDynamic = jsonDecode(json['timetable']);
    List<List<int>> timetableList = timetableDynamic.map((dynamic sublist) {
      return List<int>.from(sublist);
    }).toList();

    return User(timetable: timetableList);
  }

  // Timetable 객체를 JSON으로 변환하는 메서드
  Map<String, dynamic> toJson() {
    return {
      'timetable': jsonEncode(timetable),
    };
  }
}
