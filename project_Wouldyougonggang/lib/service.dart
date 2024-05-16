import 'package:http/http.dart' as http;
import 'package:flutter_app/user.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Services {
  static const String url =
      'https://721e-211-205-14-67.ngrok-free.app/users/dj-rest-auth/user/';

  static Future<User> fetchUserData(String accessToken) async {
    try {
      final response = await http.get(
        Uri.parse(url),
        headers: {
          'Authorization': 'Bearer $accessToken',
        },
      );

      if (response.statusCode == 200) {
        // JSON 데이터를 파싱하여 사용자 정보로 변환
        User users = userFromJson(response.body);
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

    return User(pk: 0, email: "no");
  }
}
