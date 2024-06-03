import 'dart:collection';
import 'dart:convert';

class PostList {
  final List<PostItem> posts;

  PostList({
    required this.posts
  });

  factory PostList.parse(Map json) {
    List list = json['post'];

    List<PostItem> result = [];
    list.forEach((element) {
      result.add(PostItem.parse(element));
    });

    return PostList(
        posts: result
    );
  }

  get length => posts.length;
}

class PostItem {
  final int id;
  final String name;
  final int max;
  final int current;
  final String start;
  final String end;

  PostItem({
    required this.id,
    required this.name,
    required this.max,
    required this.current,
    required this.start,
    required this.end,
  });

  factory PostItem.parse(Map json) {
    return PostItem(
      id: json['id'],
      name: json['name'],
      max: json['max'],
      current: json['current'],
      start: json['start'],
      end: json['end'],
    );
  }
}