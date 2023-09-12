import 'package:flutter/cupertino.dart';

class Post{
  var userId;
  var id;
  String? title;
  String? body;
  Post({@required this.userId,@required this.id,@required this.body,@required this.title});

  Post.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    id = json['id'];
    title = json['title'];
    body = json['body'];
  }
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['userId'] = this.userId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['body'] = this.body;
    return data;
  }
}

