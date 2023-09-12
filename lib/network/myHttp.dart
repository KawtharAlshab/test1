import 'dart:convert';

import 'package:api_example/models/post-model.dart';
import 'package:http/http.dart' as http;

class MyHttp {
 static Future<List<Post>> getposts() async {
    List<Post> _posts =[];
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
      var response = await http.get(url);
      if(response.statusCode == 200){

      }
      var responsebody = response.body;
      var responseJsonData = json.decode(responsebody);
      for(var jsonPost in responseJsonData ){
        _posts.add(Post.fromJson(jsonPost));
        print(_posts[0].userId);
      }
      return _posts ;
  }

  // static Future getposts() async {
  //   try {
  //     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
  //     var response = await http.get(url);
  //     var responsebody = response.body;
  //     var responseData = json.decode(responsebody);
  //     if (response.statusCode == 200) {
  //       print("success");
  //     } else {
  //       print("failure");
  //     }
  //     return responseData;
  //   } catch (error) {
  //     print(error);
  //     return [];
  //   }
  // }

  static Future getpostWithId(String id) async {
    try {
      var url = Uri.parse('https://jsonplaceholder.typicode.com/posts?userId=$id');
      var response = await http.get(url);
      var responsebody = response.body;
      var responseData = json.decode(responsebody);
      if (response.statusCode == 200) {
        print("success"+responseData[0]["title"]);
      } else {
        print("failure");
      }
      return responseData;
    } catch (error) {
      print(error);
      return [];
    }
  }

 static Future postPost() async {
   try {
     Map<String,dynamic> body ={

       'title': 'foo',
       'body': 'bar',
       'userId': '1',
     };
     // Post(userId: '10', id: '2', body: "body", title: "title").toJson();
     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts');
     var response = await http.post(url,body:  Post(userId: "20", id:"1", body: "body", title: "title").toJson()

     );
     var responsebody = response.body;
     var responseData = json.decode(responsebody);
     if (response.statusCode == 201) {
       print("success"+responseData['userId']);
     } else {
       print("failure");
     }
     return responseData;
   } catch (error) {
     print(error);
     return [];
   }
 }
 static Future deletePost() async {
   try {
     var url = Uri.parse('https://jsonplaceholder.typicode.com/posts/1');
     var response = await http.delete(url);
     var responsebody = response.body;
     var responseData = json.decode(responsebody);
    if(response.statusCode==200){
      print("delete successfully");
    }

   } catch (error) {
     print(error);
     return [];
   }
 }
}
