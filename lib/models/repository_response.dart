// To parse this JSON data, do
//
//     final repositoryResponse = repositoryResponseFromJson(jsonString);

import 'dart:convert';

List<RepositoryResponse> repositoryResponseFromJson(String str) =>
    List<RepositoryResponse>.from(
        json.decode(str).map((x) => RepositoryResponse.fromJson(x)));

String repositoryResponseToJson(List<RepositoryResponse> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class RepositoryResponse {
  RepositoryResponse({
    this.id,
    this.nodeId,
    this.name,
    this.fullName,
    this.private,
    this.htmlUrl,
    this.description,
    this.language,
    this.visibility,
    this.forks,
    this.openIssues,
    this.watchers,
    this.defaultBranch,
  });

  int? id;
  String? nodeId;
  String? name;
  String? fullName;
  bool? private;
  String? htmlUrl;
  String? description;
  String? language;
  String? visibility;
  int? forks;
  int? openIssues;
  int? watchers;
  String? defaultBranch;

  factory RepositoryResponse.fromJson(Map<String, dynamic> json) =>
      RepositoryResponse(
        id: json["id"],
        nodeId: json["node_id"],
        name: json["name"],
        fullName: json["full_name"],
        private: json["private"],
        htmlUrl: json["html_url"],
        description: json["description"],
        language: json["language"],
        visibility: json["visibility"],
        forks: json["forks"],
        openIssues: json["open_issues"],
        watchers: json["watchers"],
        defaultBranch: json["default_branch"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "node_id": nodeId,
        "name": name,
        "full_name": fullName,
        "private": private,
        "html_url": htmlUrl,
        "description": description,
        "language": language,
        "visibility": visibility,
        "forks": forks,
        "open_issues": openIssues,
        "watchers": watchers,
        "default_branch": defaultBranch,
      };
}
