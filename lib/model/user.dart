// To parse this JSON data, do
//
import 'dart:convert';

import 'package:floward_flutter/model/post.dart';

List<User> userFromJson(List<dynamic> data) {
  return List<User>.from(data.map((x) => User.fromJson(x)));
}

String userToJson(List<User> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class User {
  User(
      {this.albumId,
      this.userId,
      this.name,
      this.url,
      this.thumbnailUrl,
      this.posts});

  int? albumId;
  int? userId;
  String? name;
  String? url;
  String? thumbnailUrl;
  List<Post?>? posts;

  factory User.fromJson(Map<String, dynamic> json) => User(
      albumId: json["albumId"] == null ? null : json["albumId"],
      userId: json["userId"] == null ? null : json["userId"],
      name: json["name"] == null ? null : json["name"],
      url: json["url"] == null ? null : json["url"],
      thumbnailUrl: json["thumbnailUrl"] == null ? null : json["thumbnailUrl"],
      posts: []);

  Map<String, dynamic> toJson() => {
        "albumId": albumId == null ? null : albumId,
        "userId": userId == null ? null : userId,
        "name": name == null ? null : name,
        "url": url == null ? null : url,
        "thumbnailUrl": thumbnailUrl == null ? null : thumbnailUrl,
      };
}
