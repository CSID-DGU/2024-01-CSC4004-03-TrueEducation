import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

class User {
  UserInfo userInfo;
  static late final Tokens tokens;

  User({
    required this.userInfo,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    User.tokens = Tokens.fromJson(json["tokens"]);

    return User(userInfo: UserInfo.fromJson(json["user_info"]));
  }

  Map<String, dynamic> toJson() => {
        "user_info": userInfo.toJson(),
        "tokens": tokens.toJson(),
      };
}

class Tokens {
  late String test;
  String refresh;
  String access;

  Tokens({
    required this.refresh,
    required this.access,
  });

  factory Tokens.fromJson(Map<String, dynamic> json) => Tokens(
        refresh: json["refresh"],
        access: json["access"],
      );

  Map<String, dynamic> toJson() => {
        "refresh": refresh,
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
  List<List<int>> timetable;

  UserInfo({
    required this.userId,
    required this.email,
    required this.nickname,
    required this.username,
    required this.birthdate,
    required this.gender,
    required this.timetable,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    List<dynamic> timetableDynamic = jsonDecode(json['timetable']);
    List<List<int>> timetableList = timetableDynamic.map((dynamic sublist) {
      return List<int>.from(sublist);
    }).toList();

    return UserInfo(
      userId: json["user_id"],
      email: json["email"],
      nickname: json["nickname"],
      username: json["username"],
      birthdate: DateTime.parse(json["birthdate"]),
      gender: json["gender"],
      timetable: timetableList,
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
        'timetable': jsonEncode(timetable),
      };
}
