import 'dart:collection';
import 'dart:convert';

class PostList {
  final List<PostItem> posts;

  PostList({
    required this.posts
  });

  factory PostList.parse(List json) {
    List list = json;

    List<PostItem> result = [];
    for (var element in list) {
      result.add(PostItem.parse(element));
    }

    return PostList(
        posts: result
    );
  }

  get length => posts.length;
}

class PostItem {
  final int groupId;
  final String? groupImg;
  final String groupName;
  final int minAge;
  final int maxAge;
  final int groupGender;
  final int minNum;
  final int maxNum;
  final int currentNum;
  final String startTime;
  final String endTime;
  final String description;
  final bool flag;

  PostItem({
    required this.groupId,
    this.groupImg,
    required this.groupName,
    required this.minAge,
    required this.maxAge,
    required this.groupGender,
    required this.minNum,
    required this.maxNum,
    required this.currentNum,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.flag,
  });

  factory PostItem.parse(Map json) {
    return PostItem(
      groupId: json['group_id'],
      groupImg: json['group_img'],
      groupName: json['group_name'],
      minAge: json['min_age'],
      maxAge: json['max_age'],
      groupGender: json['group_gender'],
      minNum: json['min_num'],
      maxNum: json['max_num'],
      currentNum: json['current_num'],
      startTime: json['start_time'],
      endTime: json['end_time'],
      description: json['description'],
      flag: json['flag'],
    );
  }
}