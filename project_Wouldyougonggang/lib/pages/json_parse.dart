// import 'package:flutter/material.dart';
// import 'package:flutter_app/user.dart';
// import '../service.dart';

// class JsonParse extends StatefulWidget {
//   const JsonParse({Key? key}) : super(key: key);

//   @override
//   State<JsonParse> createState() => _JsonParseState();
// }

// class _JsonParseState extends State<JsonParse> {
//   late User? _user;
//   bool loading = false;

//   @override
//   void initState() {
//     super.initState();

//     Services.attemptLogin("mintim01@naver.com", "rlaalsrl01@").then((value) {
//       setState(() {
//         _user = value;
//         loading = true;
//       });
//     });

//     // Services.fetchUserData(
//     //         "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE1MTgwNzI1LCJpYXQiOjE3MTUxNzg5MjUsImp0aSI6IjhhMDgzYWU2ZDU3ZjQwOTE5ZWE2ODcyMzYyYmE0M2QxIiwidXNlcl9pZCI6NX0.NaukW9EnxExbQeHaRtHollRNdMXxRBEL-cQfbfzVtX0")
//     //     .then((value) {
//     //   setState(() {
//     //     _user = value;
//     //     loading = true;
//     //   });
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(loading ? 'User' : 'Loading...'),
//       ),
//       body: ListView(
//         children: <Widget>[
//           ListTile(
//             leading: const Icon(
//               Icons.account_circle_rounded,
//               color: Colors.blue,
//             ),
//             title: Text('User ID: ${_user.userInfo.userId}'),
//             subtitle: Text('Username: ${_user.userInfo.username}'),
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.email,
//               color: Colors.blue,
//             ),
//             title: Text('Email: ${_user.userInfo.email}'),
//             subtitle: Text('Nickname: ${_user.userInfo.nickname}'),
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.calendar_today,
//               color: Colors.blue,
//             ),
//             title: Text('Birthdate: ${_user.userInfo.birthdate.toString()}'),
//             subtitle: Text('Gender: ${_user.userInfo.gender}'),
//           ),
//           ListTile(
//             leading: const Icon(
//               Icons.vpn_key,
//               color: Colors.blue,
//             ),
//             title: Text('Refresh Token: ${_user.tokens.refresh}'),
//             subtitle: Text('Access Token: ${_user.tokens.access}'),
//           ),
//         ],
//       ),
//     );
//   }
// }
