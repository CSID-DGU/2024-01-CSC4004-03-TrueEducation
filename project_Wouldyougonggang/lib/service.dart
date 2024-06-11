import 'dart:ffi';
import 'dart:io';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/timetable.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';

class Services {
  static const String url = 'https://3a2b-210-94-220-228.ngrok-free.app/';

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

      print('login response!!!!!: ${response.statusCode}');

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

  static Future<Timetable?> makeUserTimetable(
      String accessToken, XFile image) async {
    try {
      var request =
          http.MultipartRequest('POST', Uri.parse('${url}create_calendar/'));
      request.headers['Authorization'] = 'Bearer $accessToken'; // JWT 토큰 추가
      request.files.add(await http.MultipartFile.fromPath('image', image.path));

      var response = await request.send();
      if (response.statusCode == 201) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        String responseBody = await response.stream.bytesToString();
        Timetable timetable = Timetable.fromJson(json.decode(responseBody));
        return timetable;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 로그인 실패
        print('making timetable failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during making timetable: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }

    return null;
  }

  static Future<Timetable?> getUserTimetable(String accessToken) async {
    try {
      // HTTP POST 요청을 사용하여 로그인 시도
      final response = await http.get(
        Uri.parse('${url}get_calendar/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        Timetable timetable = Timetable.fromJson(json.decode(response.body));
        return timetable;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 로그인 실패
        print('getting variation failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during getting variation: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }

    return null;
  }

  static Future<Timetable?> makeUserVariation(
      String accessToken, String text, int day, String time,
      {bool flag = false}) async {
    try {
      Map<String, dynamic> data = {
        "text": text,
        "day": day,
        "variable_time": "${time}000"
      };

      // HTTP POST 요청을 사용하여 로그인 시도
      final response = await http.post(
        Uri.parse('${url}make_variation/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
        body: jsonEncode(data),
      );

      if (response.statusCode == 201) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        Timetable timetable = Timetable.fromJson(json.decode(response.body));

        return timetable;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 로그인 실패
        print('making variation failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during making variation: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }

    return null;
  }

  static Future<List<Variation>?> getUserVariation(String accessToken) async {
    try {
      // HTTP POST 요청을 사용하여 로그인 시도
      final response = await http.get(
        Uri.parse('${url}get_variation/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        List<dynamic> jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        List<Variation> variList =
            jsonData.map((item) => Variation.fromJson(item)).toList();
        return variList;
        // 여기서 사용자 정보를 활용하여 필요한 작업을 수행할 수 있습니다.
        // 예: 데이터베이스에 사용자 정보 저장, 화면에 표시 등
      } else {
        // 로그인 실패
        print('getting variation failed. Status code: ${response.statusCode}');
        // 여기서 실패 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
      }
    } catch (e) {
      // 오류 처리
      print('Error during getting variation: $e');
      // 여기서 오류 발생 시 처리할 작업을 수행하세요 (예: 오류 메시지 표시 등)
    }

    return null;
  }
}
