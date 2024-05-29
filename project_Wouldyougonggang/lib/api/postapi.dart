import 'dart:convert';

import 'package:flutter_app/model/postmodel.dart';
import 'package:http/http.dart' as http;

String data = '''
  {
    "post":[{
      "id": 0,
      "img":"",
      "name":"test1",
      "gender":3,
      "age":30,
      "max":10,
      "current":3,
      "start":"2024-05-30 09:00:00",
      "end":"2024-05-30 10:00:00"
    },{
      "id": 1,
      "img":"",
      "name":"test2",
      "gender":2,
      "age":40,
      "max":5,
      "current":3,
      "start":"2024-05-30 09:00:00",
      "end":"2024-05-30 10:00:00"
    },{
      "id": 2,
      "img":"",
      "name":"test3",
      "gender":1,
      "age":30,
      "max":5,
      "current":1,
      "start":"2024-05-31 13:00:00",
      "end":"2024-05-31 13:30:00"
    }]
  }
  ''';

Future<PostList> fetchPost() async {
  // const url = 'https://localhost/posts';
  // final response = await http.get(Uri.parse(url));
  //
  // if (response.statusCode == 200) {
  //   Map<String, dynamic> jsondata = jsonDecode(data);
  //   return PostList.fromJson(jsondata);
  // }

    Map<String, dynamic> jsondata = jsonDecode(data);
    return PostList.fromJson(jsondata);

  // throw Exception(response.statusCode);
}