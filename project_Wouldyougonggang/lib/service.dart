import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Services {
  static const String url =
      'https://107f-210-94-220-228.ngrok-free.app/calendar/';

  static Future<User> fetchUserData(String accessToken, XFile image) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse(url));
      request.headers['Authorization'] = 'Bearer $accessToken'; // JWT 토큰 추가
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        String responseBody = await response.stream.bytesToString();
        User users = userFromJson(responseBody);
        Fluttertoast.showToast(msg: "email: $users");
        return users;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 서버로부터 데이터를 성공적으로 가져오지 못한 경우
        throw Exception('Failed to load user data');
      }
    } catch (e) {
      // 오류 처리
      Fluttertoast.showToast(
        msg: 'Error: $e',
        toastLength: Toast.LENGTH_SHORT,
      );
    }

    return User(/*pk: 0, email: "no"*/ timetable: [[], [], [], [], [], [], []]);
  }
}
