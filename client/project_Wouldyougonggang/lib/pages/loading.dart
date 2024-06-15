// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:flutter_app/pages/login.dart';
// import 'dart:ui';

// class Loading extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     final String imageLogoName = 'assets/images/public/PurpleLogo.svg';

//     var screenHeight = MediaQuery.of(context).size.height;
//     var screenWidth = MediaQuery.of(context).size.width;

//     return WillPopScope(
//       onWillPop: () async => false,
//       child: MediaQuery(
//         data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
//         child: new Scaffold(
//           body: new Container(
//             //height : MediaQuery.of(context).size.height,
//             //color: kPrimaryColor,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: <Widget>[
//                 SizedBox(height: screenHeight * 0.384375),
//                 Container(
//                   child: Text(
//                     'Would You\n공강',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                       fontFamily: 'Pretendard-Regular',
//                       fontSize: 60,
//                     ),
//                   ),
//                 ),
//                 Expanded(child: SizedBox()),
//                 Align(
//                   child: Text("© Copyright 2020, 내방니방(MRYR)",
//                       style: TextStyle(
//                         fontSize: screenWidth * (14 / 360),
//                         color: Color.fromRGBO(255, 255, 255, 0.6),
//                       )),
//                 ),
//                 SizedBox(
//                   height: MediaQuery.of(context).size.height * 0.0625,
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   @override
//   void initState() {
//     Timer(Duration(milliseconds: 1500), () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
//     });
//   }
// }
