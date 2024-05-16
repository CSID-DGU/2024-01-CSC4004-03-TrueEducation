// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    int pk;
    String email;

    User({
        required this.pk,
        required this.email,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        pk: json["pk"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "pk": pk,
        "email": email,
    };
}
