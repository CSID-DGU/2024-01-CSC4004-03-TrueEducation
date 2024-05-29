import 'dart:collection';
import 'dart:convert';

class PostList {
  List<PostItem> posts;

  PostList({
    required this.posts
  });

  factory PostList.fromJson(Map<String, dynamic> json) {
    List list = jsonDecode(json['post']);

    return PostList(
        posts: list.map((element) => PostItem.fromJson(element)).toList()
    );
  }

  get length => posts.length;
}

class PostItem {
  int id;
  String img;
  String name;
  int gender;
  int age;
  int max;
  int current;
  String start;
  String end;

  PostItem({
    required this.id,
    required this.img,
    required this.name,
    required this.gender,
    required this.age,
    required this.max,
    required this.current,
    required this.start,
    required this.end,
  });

  factory PostItem.fromJson(Map<String, dynamic> json) {
    return PostItem(
      id: json['id'],
      img: json['img'],
      name: json['name'],
      gender: json['gender'],
      age: json['age'],
      max: json['max'],
      current: json['current'],
      start: json['start'],
      end: json['end'],
    );
  }
}