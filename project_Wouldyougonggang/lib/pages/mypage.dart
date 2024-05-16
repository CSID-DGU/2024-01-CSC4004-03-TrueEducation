import 'package:flutter/material.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _project_WouldyougonggangState();
}

class _project_WouldyougonggangState extends State<MyPage> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text('Mypage'),
      ),
    );
  }
}
