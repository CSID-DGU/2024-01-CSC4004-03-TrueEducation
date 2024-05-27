// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  int pk;
  String email;
  List<List<int>>? calendar;

  User({
    required this.pk,
    required this.email,
    List<List<int>>? calendar,
  }) : calendar = calendar ?? [[], [], [], [], [], [], []]; // 기본값 설정

  factory User.fromJson(Map<String, dynamic> json) => User(
        pk: json["pk"],
        email: json["email"],
        calendar: json["calendar"] != null
            ? List<List<int>>.from(json["calendar"])
            : null, // calendar가 null이 아닌 경우에만 값을 설정
      );

  Map<String, dynamic> toJson() => {
        "pk": pk,
        "email": email,
        "calendar": calendar,
      };
}
