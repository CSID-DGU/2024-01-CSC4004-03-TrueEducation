// import 'package:flutter/material.dart';
// import 'package:flutter_app/user.dart';
// import '../service.dart';

// class JsonParse extends StatefulWidget {
//   const JsonParse({super.key});

//   @override
//   State<JsonParse> createState() => _JsonParseState();
// }

// class _JsonParseState extends State<JsonParse> {
//   User _user = User(pk: 0, email: "");
//   bool loading = false;

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     Services.fetchUserData(
//             "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzE1MTgwNzI1LCJpYXQiOjE3MTUxNzg5MjUsImp0aSI6IjhhMDgzYWU2ZDU3ZjQwOTE5ZWE2ODcyMzYyYmE0M2QxIiwidXNlcl9pZCI6NX0.NaukW9EnxExbQeHaRtHollRNdMXxRBEL-cQfbfzVtX0")
//         .then((value) {
//       setState(() {
//         _user = value;
//         loading = true;
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(loading ? 'User' : 'Loading...'),
//       ),
//       body: ListView.builder(
//         itemCount: 1,
//         itemBuilder: (context, index) {
//           User user = _user;
//           return ListTile(
//             leading: const Icon(
//               Icons.account_circle_rounded,
//               color: Colors.blue,
//             ),
//             trailing: IconButton(
//               onPressed: () {
//                 showDialog(
//                   context: context,
//                   builder: (context) {
//                     return AlertDialog(
//                       title: Text(user.email),
//                       content: Column(
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Text(user.email),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                             child: const Text('Close'),
//                           ),
//                         ],
//                       ),
//                     );
//                   },
//                 );
//               },
//               icon: const Icon(
//                 Icons.phone_android_outlined,
//                 color: Colors.red,
//               ),
//             ),
//             title: Text(user.email),
//             subtitle: Text(user.email),
//           );
//         },
//       ),
//     );
//   }
// }
