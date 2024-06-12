import 'dart:convert';
import 'dart:ffi';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class User {
  static late UserInfo userInfo;
  static late Tokens tokens;

  User();

  factory User.fromJson(Map<String, dynamic> json) {
    User.tokens = Tokens.fromJson(json["tokens"]);
    User.userInfo = UserInfo.fromJson(json["user_info"]);
    return User();
  }

  Map<String, dynamic> toJson() => {
        "user_info": userInfo.toJson(),
        "tokens": tokens.toJson(),
      };
}

class Timetable {
  List<List<int>> timetable;

  Timetable({
    required this.timetable,
  });

  factory Timetable.fromJson(Map<String, dynamic> json) {
    List<dynamic> timetableDynamic = jsonDecode(json['timetable']);
    List<List<int>> timetableList = timetableDynamic.map((dynamic sublist) {
      return List<int>.from(sublist);
    }).toList();

    return Timetable(
      timetable: timetableList,
    );
  }

  Map<String, dynamic> toJson(Map<String, dynamic> json) => {
        "timetable": timetable,
      };
}

class Variation {
  String text;
  int day;
  String time;

  Variation({
    required this.text,
    required this.day,
    required this.time,
  });

  factory Variation.fromJson(Map<String, dynamic> json) => Variation(
      text: json["text"], day: json["day"], time: json["variable_time"]);

  Map<String, dynamic> toJson() => {
        "text": text,
        "day": day,
        "variable_time": time,
      };
}

class Tokens {
  String access;

  Tokens({
    required this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "access": access,
      };
}

class UserInfo {
  int userId;
  String email;
  String nickname;
  String username;
  DateTime birthdate;
  int gender;

  UserInfo({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.username,
    required this.birthdate,
    required this.gender,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      userId: json["user_id"],
      email: json["email"],
      nickname: json["nickname"],
      username: json["username"],
      birthdate: DateTime.parse(json["birthdate"]),
      gender: json["gender"],
    );
  }

  Map<String, dynamic> toJson() => {
        "user_id": userId,
        "email": email,
        "nickname": nickname,
        "username": username,
        "birthdate":
            "${birthdate.year.toString().padLeft(4, '0')}-${birthdate.month.toString().padLeft(2, '0')}-${birthdate.day.toString().padLeft(2, '0')}",
        "gender": gender,
      };
}
