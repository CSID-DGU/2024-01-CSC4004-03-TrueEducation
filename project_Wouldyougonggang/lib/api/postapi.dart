import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:http/http.dart' as http;

Future<PostList?> fetchPost(bool state) async {
  try {
    String urlPath = (state) ? '${url}recommand_group_list/' : '${url}my_group_list/';

    final response = await http.post(
      Uri.parse(urlPath),
      headers: {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token},
    );

    if(response.statusCode == 201) {
      debugPrint('성공');
      try {
        List jsonData = jsonDecode(response.body);
        return RecommendPostList.parse(jsonData);
      }
      catch (e) {
        Map jsonData = jsonDecode(response.body);
        return MyPostList.parse(jsonData);
      }
    }

    else if(response.statusCode == 500){
    }

    else {
      debugPrint(response.statusCode.toString());
    }

    return null;
  } catch (e) {
    debugPrint(e.toString());
    return null;
  }
}

const String url = '';
String token = 'Bearer ';

Future<bool> applyPost(int groupId) async {
  debugPrint('통신 시작');
  try {
    Map<String, int> data = {'group':groupId};

    debugPrint(data.toString());

    final response = await http.post(
      Uri.parse('${url}apply_group/'),
      headers: {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': '$token'},
      body: jsonEncode(data)
    );

    if(response.statusCode == 201) {
      debugPrint('성공');
      return true;
    }

    else if(response.statusCode == 500){
    }

    else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    debugPrint(e.toString());
    return false;
  }
}

Future<bool> createPost(String groupName, int minAge, int maxAge, int groupGender, int minNum, int maxNum,
    String startTime, String endTime, String description) async {
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

    final response = await http.post(
      Uri.parse('${url}create_group/'),
      headers: {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token},
      body: jsonEncode(data)
    );

    if(response.statusCode == 201) {
      debugPrint('성공');
      return true;
    }

    else if(response.statusCode == 500){
    }

    else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    return false;
  }
}

Future<bool> acceptMember(int groupId, int userId) async {
  try {
    Map<String, dynamic> data = {
      "group": groupId,
      "user": userId
    };

    final response = await http.post(
        Uri.parse('${url}accept_member/'),
        headers: {'Content-Type': 'application/json; charset=UTF-8', 'Authorization': token},
        body: jsonEncode(data)
    );

    if(response.statusCode == 201) {
      debugPrint('성공');
      return true;
    }

    else if(response.statusCode == 500){
    }

    else {
      debugPrint(response.statusCode.toString());
    }

    return false;
  } catch (e) {
    return false;
  }
}