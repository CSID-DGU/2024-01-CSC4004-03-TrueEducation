import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_app/model/postmodel.dart';
import 'package:flutter_app/pages/detailedPost.dart';
import 'package:flutter_app/pages/evaluateMain.dart';
import 'package:flutter_app/pages/newPost.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_app/api/postapi.dart';

class Post extends StatefulWidget {
  const Post({super.key});

  @override
  State<Post> createState() => _PostState();
}

class _PostState extends State<Post> {
  bool isRecomend = true;
  bool isMy = false;
  late List<bool> isSelected;

  late PostList? postList;

  @override
  void initState(){
    isSelected = [isRecomend, isMy];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 60,
                    width: MediaQuery.of(context).size.width - 120,
                    margin: const EdgeInsets.fromLTRB(25, 20, 5, 10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: const Color(0xFF000000),
                        width: 1
                      ),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      children: [
                        const Icon(
                          Icons.search,
                          size: 40,
                        ),
                        Container()
                      ],
                    ),
                  ),
                  Container(
                    height: 60,
                    width: 60,
                    margin: const EdgeInsets.fromLTRB(5, 20, 25, 10),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => NewPost()));
                      },
                      icon: const Icon(Icons.add),
                      iconSize: 45,
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 40,
                    margin: const EdgeInsets.fromLTRB(25, 0, 5, 10),
                    child: ToggleButtons(
                      borderRadius: BorderRadius.circular(10),
                      borderColor: Colors.black,
                      selectedBorderColor: Colors.black,
                      fillColor: const Color(0xFF7f8bf8),
                      isSelected: isSelected,
                      onPressed: toggleSelect,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Text(
                            '추천 모임',
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color(0xFF000000)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 5,
                          child: Text(
                            '내 모임',
                            style: GoogleFonts.getFont(
                                'Inter',
                                fontWeight: FontWeight.w500,
                                fontSize: 15,
                                color: const Color(0xFF000000)
                            ),
                            textAlign: TextAlign.center,
                          ),
                        )
                      ],
                    ),
                  ),
                  Container()
                ],
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: const Divider(color: Colors.black, thickness: 1),
              )
            ],
          ),
          FutureBuilder<PostList> (
            future: fetchPost(),
            builder: (context, snapshot) {
              postList = snapshot.data;

              if (snapshot.connectionState != ConnectionState.done) {
                debugPrint('connect error');
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }

              if (snapshot.hasError) {
                debugPrint('error${snapshot.error}');
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              }

              if (postList != null) {
                return listview_builder();
              }

              return const Text('no data found');
            }
          )
        ],
      ),
    );
  }

  Widget listview_builder() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: postList!.length,
      itemBuilder: (context, index) {
        final post = (postList as List<PostItem>)[index];

        return Padding(
          padding: const EdgeInsets.all(8),
          child: Card(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(post.id.toString()),
                Text(post.name.toString()),
                Text(post.gender.toString()),
                Text(post.age.toString()),
                Text(post.max.toString()),
                Text(post.current.toString()),
                Text(post.start.toString()),
                Text(post.end.toString()),
              ],
            ),
          ),
        );
      },
    );
  }

  void toggleSelect(value) {
    if (value == 0) {
      isRecomend = true;
      isMy = false;
    }
    else {
      isRecomend = false;
      isMy = true;
    }
    setState(() {
      isSelected = [isRecomend, isMy];
    });
  }
}
