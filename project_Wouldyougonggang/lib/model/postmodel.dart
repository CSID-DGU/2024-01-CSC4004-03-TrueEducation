import 'dart:collection';
import 'dart:convert';
import 'package:flutter_app/api/postapi.dart';

abstract class PostList {
  final List<PostItem> posts;
  final List<PostItem>? join;
  final List<PostItem>? wait;

  PostList({required this.posts, this.join, this.wait});

  get length => posts.length;
}

class RecommendPostList extends PostList {
  RecommendPostList({required super.posts});

  factory RecommendPostList.parse(List json) {
    List list = json;

    List<RecommendPostItem> result = [];
    for (var element in list) {
      result.add(RecommendPostItem.parse(element));
    }

    return RecommendPostList(posts: result);
  }
}

class MyPostList extends PostList {
  MyPostList({required super.posts, required super.join, required super.wait});

  factory MyPostList.parse(Map json) {
    List<MyPostItem> myGroup = [];
    List<MyPostItem> join = [];
    List<MyPostItem> wait = [];

    List list = json['my_group'];
    for (var element in list) {
      myGroup.add(MyPostItem.parse(element));
    }

    list = json['join'];
    for (var element in list) {
      join.add(MyPostItem.parse(element));
    }

    list = json['wait'];
    for (var element in list) {
      wait.add(MyPostItem.parse(element));
    }

    return MyPostList(posts: myGroup, join: join, wait: wait);
  }

  @override
  get length => posts.length + join!.length + wait!.length;
}

abstract class PostItem {
  final int groupId;
  final List<Member>? member;
  final String? groupImg;
  final String groupName;
  final int minAge;
  final int maxAge;
  final int groupGender;
  final int minNum;
  final int maxNum;
  final int currentNum;
  final List<String> startTime;
  final List<String> endTime;
  final String description;
  final int? state;

  PostItem({
    required this.groupId,
    this.groupImg,
    this.member,
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
    this.state,
  });
}

class Member {
  final int id;
  int state;
  final String name;
  final String nickname;
  final int grade;

  Member(
      {required this.id,
      required this.state,
      required this.name,
      required this.nickname,
      required this.grade});

  factory Member.parse(Map json) {
    return Member(
        id: json['user'],
        state: json['state'],
        name: json['user_name'],
        nickname: json['user_nickname'],
        grade: json['user_grade']);
  }
}

class RecommendPostItem extends PostItem {
  RecommendPostItem({
    required super.groupId,
    super.groupImg,
    required super.groupName,
    required super.minAge,
    required super.maxAge,
    required super.groupGender,
    required super.minNum,
    required super.maxNum,
    required super.currentNum,
    required super.startTime,
    required super.endTime,
    required super.description,
  });

  factory RecommendPostItem.parse(Map json) {
    return RecommendPostItem(
      groupId: json['group_id'],
      groupImg: json['group_img'],
      groupName: json['group_name'],
      minAge: json['min_age'],
      maxAge: json['max_age'],
      groupGender: json['group_gender'],
      minNum: json['min_num'],
      maxNum: json['max_num'],
      currentNum: json['current_num'],
      startTime: json['start_time'].toString().split(RegExp(r'[ \-\:T]')),
      endTime: json['end_time'].toString().split(RegExp(r'[ \-\:T]')),
      description: json['description'],
    );
  }
}

class MyPostItem extends PostItem {
  MyPostItem({
    required super.groupId,
    super.groupImg,
    required super.member,
    required super.groupName,
    required super.minAge,
    required super.maxAge,
    required super.groupGender,
    required super.minNum,
    required super.maxNum,
    required super.currentNum,
    required super.startTime,
    required super.endTime,
    required super.description,
    required super.state,
  });

  factory MyPostItem.parse(Map json) {
    List<Member> member = [];

    try {
      List list = json['member'];
      for (var element in list) {
        member.add(Member.parse(element));
      }
    } catch (e) {
      member = [];
    }

    return MyPostItem(
        groupId: json['group_id'],
        member: member,
        groupImg: json['group_img'],
        groupName: json['group_name'],
        minAge: json['min_age'],
        maxAge: json['max_age'],
        groupGender: json['group_gender'],
        minNum: json['min_num'],
        maxNum: json['max_num'],
        currentNum: json['current_num'],
        startTime: json['start_time'].toString().split(RegExp(r'[ \-\:T]')),
        endTime: json['end_time'].toString().split(RegExp(r'[ \-\:T]')),
        description: json['description'],
        state: json['current_state']);
  }
}
