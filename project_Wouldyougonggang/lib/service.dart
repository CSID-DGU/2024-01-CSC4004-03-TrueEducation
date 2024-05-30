import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static const String url = 'https://107f-210-94-220-228.ngrok-free.app/login/';

  static Future<User?> attemptLogin(String email, String password) async {
    try {
      // 서버로 보낼 데이터를 맵 형태로 구성
      Map<String, dynamic> data = {"email": email, "password": password};

      // HTTP POST 요청을 사용하여 로그인 시도
      final response = await http.post(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode(data),
      );

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
}
