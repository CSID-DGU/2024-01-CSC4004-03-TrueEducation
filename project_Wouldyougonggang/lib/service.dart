import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Services {
  static const String url = 'https://67bf-106-101-128-73.ngrok-free.app/';

  static Future<User?> attemptLogin(String email, String password) async {
    try {
      // 서버로 보낼 데이터를 맵 형태로 구성
      Map<String, dynamic> data = {"email": email, "password": password};

      // HTTP POST 요청을 사용하여 로그인 시도
      final response = await http.post(
        Uri.parse('${url}login/'),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );

      print('response!!!!!: ${response.statusCode}');

      // HTTP 응답 코드 확인
      if (response.statusCode == 201) {
        // 로그인 성공
        print('Login successful!');
        // 여기서 필요한 추가 작업을 수행하세요 (예: 로그인 정보 저장, 화면 이동 등)
        //User user = userFromJson(response.body);
        //jsonDecode(utf8.decode(response.bodyBytes));
        User user = User.fromJson(jsonDecode(utf8.decode(response.bodyBytes)));
        return user;
      } else {
        // 로그인 실패
        print('Login failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during login: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }
    return null;
  }

  static Future<User?> fetchUserTimetable(
      String accessToken, XFile image) async {
    try {
      var request = http.MultipartRequest('POST', Uri.parse('${url}calendar/'));
      request.headers['Authorization'] = 'Bearer $accessToken'; // JWT 토큰 추가
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();
      if (response.statusCode == 200) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        String responseBody = await response.stream.bytesToString();
        User user = userFromJson(responseBody);
        Fluttertoast.showToast(msg: "email: $user");
        return user;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 로그인 실패
        print('Login failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during login: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }

    return null;
  }
}
