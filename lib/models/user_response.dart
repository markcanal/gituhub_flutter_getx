// To parse this JSON data, do
//
//     final userResponse = userResponseFromJson(jsonString);

import 'dart:convert';

UserResponse userResponseFromJson(String str) =>
    UserResponse.fromJson(json.decode(str));

String userResponseToJson(UserResponse data) => json.encode(data.toJson());

class UserResponse {
  UserResponse({
    this.login,
    this.id,
    this.nodeId,
    this.avatarUrl,
    this.gravatarId,
    this.url,
    this.htmlUrl,
    this.followersUrl,
    this.followingUrl,
    this.reposUrl,
    this.name,
    this.company,
    this.blog,
    this.location,
    this.twitterUsername,
    this.publicRepos,
    this.publicGists,
    this.followers,
    this.following,
    this.createdAt,
    this.updatedAt,
  });

  String? login;
  int? id;
  String? nodeId;
  String? avatarUrl;
  String? gravatarId;
  String? url;
  String? htmlUrl;
  String? followersUrl;
  String? followingUrl;
  String? reposUrl;
  String? name;
  String? company;
  String? blog;
  String? location;
  String? twitterUsername;
  int? publicRepos;
  int? publicGists;
  int? followers;
  int? following;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory UserResponse.fromJson(Map<String, dynamic> json) => UserResponse(
        login: json["login"],
        id: json["id"],
        nodeId: json["node_id"],
        avatarUrl: json["avatar_url"],
        gravatarId: json["gravatar_id"],
        url: json["url"],
        htmlUrl: json["html_url"],
        followersUrl: json["followers_url"],
        followingUrl: json["following_url"],
        reposUrl: json["repos_url"],
        name: json["name"],
        company: json["company"],
        blog: json["blog"],
        location: json["location"],
        twitterUsername: json["twitter_username"],
        publicRepos: json["public_repos"],
        publicGists: json["public_gists"],
        followers: json["followers"],
        following: json["following"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "login": login,
        "id": id,
        "node_id": nodeId,
        "avatar_url": avatarUrl,
        "gravatar_id": gravatarId,
        "url": url,
        "html_url": htmlUrl,
        "followers_url": followersUrl,
        "following_url": followingUrl,
        "repos_url": reposUrl,
        "name": name,
        "company": company,
        "blog": blog,
        "location": location,
        "twitter_username": twitterUsername,
        "public_repos": publicRepos,
        "public_gists": publicGists,
        "followers": followers,
        "following": following,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
