import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:http/http.dart' as http;

String data = '''
  [
    {
      "group_id": 1,
      "group_img": null,
      "group_name": "Hiking Club",
      "min_age": 18,
      "max_age": 45,
      "group_gender": 1,
      "min_num": 5,
      "max_num": 20,
      "current_num": 10,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "A group for hiking enthusiasts.",
      "flag": false
    },
    {
      "group_id": 2,
      "group_img": null,
      "group_name": "Hiking Club",
      "min_age": 18,
      "max_age": 45,
      "group_gender": 1,
      "min_num": 5,
      "max_num": 20,
      "current_num": 10,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "A group for hiking enthusiasts.",
      "flag": false
    },
    {
      "group_id": 3,
      "group_img": null,
      "group_name": "테스트",
      "min_age": 0,
      "max_age": 30,
      "group_gender": 3,
      "min_num": 2,
      "max_num": 4,
      "current_num": 3,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "안녕하세요",
      "flag": false
    },
    {
      "group_id": 4,
      "leader": 1,
      "group_img": null,
      "group_name": "테스트",
      "min_age": 0,
      "max_age": 30,
      "group_gender": 3,
      "min_num": 2,
      "max_num": 4,
      "current_num": 3,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "안녕하세요",
      "flag": false
    },
    {
      "group_id": 5,
      "leader": 1,
      "group_img": null,
      "group_name": "테스트",
      "min_age": 0,
      "max_age": 30,
      "group_gender": 3,
      "min_num": 2,
      "max_num": 4,
      "current_num": 3,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "안녕하세요",
      "flag": false
    },
    {
      "group_id": 6,
      "leader": 1,
      "group_img": null,
      "group_name": "테트",
      "min_age": 0,
      "max_age": 30,
      "group_gender": 3,
      "min_num": 2,
      "max_num": 4,
      "current_num": 3,
      "start_time": "2024-06-05T09:00:00",
      "end_time": "2024-06-05T17:00:00",
      "description": "안녕하세요",
      "flag": false
    }
  ]
  ''';

String my = '''
{
	"my_group": [
		{
			"group_id": 12,
			"member": [],
			"group_img": null,
			"group_name": "예외 테스트1",
			"min_age": 0,
			"max_age": 30,
			"group_gender": 3,
			"min_num": 2,
			"max_num": 4,
			"current_num": 3,
			"start_time": "2024-06-05T09:00:00",
			"end_time": "2024-06-05T17:00:00",
			"description": "안녕하세요",
			"current_state": 1,
			"flag": false,
			"leader": 1
		},
		{
			"group_id": 13,
			"member": [
				{
					"id": 1,
					"user": 16,
					"state": 2,
					"group": 13
				}
			],
			"group_img": null,
			"group_name": "예외 테스트2",
			"min_age": 0,
			"max_age": 30,
			"group_gender": 3,
			"min_num": 2,
			"max_num": 4,
			"current_num": 3,
			"start_time": "2024-06-05T09:00:00",
			"end_time": "2024-06-05T17:00:00",
			"description": "안녕하세요",
			"current_state": 1,
			"flag": false,
			"leader": 1
		},
		{
			"group_id": 14,
			"member": [
				{
					"id": 2,
					"user": 16,
					"state": 1,
					"group": 14
				}
			],
			"group_img": null,
			"group_name": "예외 테스트3",
			"min_age": 0,
			"max_age": 30,
			"group_gender": 3,
			"min_num": 2,
			"max_num": 4,
			"current_num": 3,
			"start_time": "2024-06-05T09:00:00",
			"end_time": "2024-06-05T17:00:00",
			"description": "안녕하세요",
			"current_state": 1,
			"flag": false,
			"leader": 1
		}
	],
	"join": [],
	"wait": []
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

    List jsondata = jsonDecode(data);

    return PostList.parse(jsondata);

  // throw Exception(response.statusCode);
}