import 'dart:developer';
import 'package:api_example/main.dart';
import 'package:api_example/network/myHttp.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'models/post-model.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {


  // List posts = [];
  List<Post> posts = [];

  @override
  void initState() {
    // TODO: implement initState
  // MyHttp.getposts().then((value) {
  //      setState(() {
  //        posts.addAll(value) ;
  //        print(posts[0]['id']);
  //      });
  //  });
   // -------
  //   MyHttp.getpostWithId("1").then((value) {
  //      setState(() {
  //        posts.addAll(value) ;
  //      });
  //
  //    });
   MyHttp.postPost();
    super.initState();
    // getposts().then((value) {
    //   setState(() {
    //     posts.addAll(value) ;
    //   });
    //
    // });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
     floatingActionButton: FloatingActionButton(
       onPressed: () { MyHttp.postPost(); },
       child: Icon(Icons.add),
     ),
        body:FutureBuilder(
          future:MyHttp.getposts(),
          builder: (context, snapshot) {
            return
              //snapshot.hasData ?
            // print(snapshot.data![0].userId.toString()+"koko");
     ListView.separated( itemCount: snapshot.data!.length,itemBuilder: (context, index) {

    return
    Container(
    width: MediaQuery.of(context).size.width,
    height: 100,
    decoration: BoxDecoration(
    color: Colors.deepPurple,
    borderRadius: BorderRadius.circular(25)),
    child: ListTile(
    title: Text(snapshot.data![index].title.toString()),
      trailing: IconButton(icon: Icon(Icons.delete),onPressed: () {
        MyHttp.deletePost();
      },),
    ),);
    },separatorBuilder: (context, index) {
    return SizedBox(
    height: 10,
    );
    },
    );
            //:CircularProgressIndicator();
    } ));
  }


  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: posts.isEmpty || posts == null
  //         ? CircularProgressIndicator()
  //         : ListView.separated(itemBuilder: (context, index) {
  //           return Container(
  //             width: MediaQuery.of(context).size.width,
  //             height: 100,
  //             decoration: BoxDecoration(
  //                 color: Colors.deepPurple,
  //                 borderRadius: BorderRadius.circular(25)),
  //             child: ListTile(
  //               title: Text(posts[index]["title"].toString()),
  //             ),
  //           );
  //         },separatorBuilder: (context, index) {
  //           return SizedBox(
  //             height: 10,
  //           );
  //         },
  //     itemCount: posts.length,)
  //   );
  // }
}
