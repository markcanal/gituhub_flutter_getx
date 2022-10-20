// To parse this JSON data, do
//
//     final userCollection = userCollectionFromJson(jsonString);

import 'dart:convert';

List<UserCollection> userCollectionFromJson(String str) =>
    List<UserCollection>.from(
        json.decode(str).map((x) => UserCollection.fromJson(x)));

String userCollectionToJson(List<UserCollection> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class UserCollection {
  UserCollection({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.url,
    this.htmlUrl,
    this.receivedEventsUrl,
  });

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? url;
  String? htmlUrl;
  String? receivedEventsUrl;

  factory UserCollection.fromJson(Map<String, dynamic> json) => UserCollection(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        url: json["url"],
        htmlUrl: json["html_url"],
        receivedEventsUrl: json["received_events_url"],
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "url": url,
        "html_url": htmlUrl,
        "received_events_url": receivedEventsUrl,
      };
}
