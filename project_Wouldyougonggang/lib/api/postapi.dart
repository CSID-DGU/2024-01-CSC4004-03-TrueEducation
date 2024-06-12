import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:http/http.dart' as http;

const String url = 'https://b777-210-94-220-228.ngrok-free.app/';

Future<PostList?> fetchPost(bool state, String token) async {
  try {
    String urlPath =
        (state) ? '${url}recommand_group_list/' : '${url}my_group_list/';

    final response = await http.get(
      Uri.parse(urlPath),
      headers: {
        'Content-Type': 'application/json; charset=UTF-8',
        'Authorization': 'Bearer $token'
      },
    );

    if (response.statusCode == 200) {
      debugPrint('성공');
      try {
        List jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return RecommendPostList.parse(jsonData);
      } catch (e) {
        Map jsonData = jsonDecode(utf8.decode(response.bodyBytes));
        return MyPostList.parse(jsonData);
      }
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return null;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

Future<bool> applyPost(int groupId, String token) async {
  try {
    Map<String, int> data = {'group': groupId};

    debugPrint(data.toString());

    final response = await http.post(Uri.parse('${url}apply_group/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      debugPrint('성공');
      return true;
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> createPost(
    String groupName,
    int minAge,
    int maxAge,
    int groupGender,
    int minNum,
    int maxNum,
    String startTime,
    String endTime,
    String description,
    String token) async {
  try {
    Map<String, dynamic> data = {
      "group_name": groupName,
      "min_age": minAge,
      "max_age": maxNum,
      "group_gender": groupGender,
      "min_num": minNum,
      "max_num": maxNum,
      "start_time": startTime,
      "end_time": endTime,
      "description": description
    };

    final response = await http.post(Uri.parse('${url}create_group/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      debugPrint('성공');
      return true;
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    return false;
  }
}

Future<bool> acceptMember(int groupId, int userId, String token) async {
  try {
    Map<String, dynamic> data = {"group": groupId, "user": userId};

    final response = await http.post(Uri.parse('${url}accept_member/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token'
        },
        body: jsonEncode(data));

    if (response.statusCode == 201) {
      debugPrint('성공');
      return true;
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    return false;
  }
}

Future<bool> changeState(int groupId, String token) async {
  try {
    Map<String, int> data = {'group': groupId};

    debugPrint(data.toString());

    final response = await http.post(Uri.parse('${url}trans_group_state/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));

    if (response.statusCode == 200) {
      debugPrint('성공');
      return true;
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<MemberList?> getMember(int groupId, String token) async {
  try {
    Map<String, int> data = {'group': groupId};

    debugPrint(data.toString());

    final response = await http.post(Uri.parse('${url}get_member/'),
        headers: {
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode(data));
    if (response.statusCode == 200) {
      debugPrint('성공');
      return MemberList.parse(jsonDecode(utf8.decode(response.bodyBytes)));
    } else if (response.statusCode == 500) {
      debugPrint('서버 내부 오류');
    } else if (response.statusCode == 401) {
      debugPrint('토큰 오류');
    } else if (response.statusCode == 405) {
      debugPrint('request 형식 오류');
    } else {
      debugPrint(response.statusCode.toString());
    }

    return null;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}
