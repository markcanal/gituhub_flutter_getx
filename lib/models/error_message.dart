// To parse this JSON data, do
//
//     final errorMessage = errorMessageFromJson(jsonString);

import 'dart:convert';

ErrorMessage errorMessageFromJson(String str) =>
    ErrorMessage.fromJson(json.decode(str));

String errorMessageToJson(ErrorMessage data) => json.encode(data.toJson());

class ErrorMessage {
  ErrorMessage({
    this.message,
    this.documentationUrl,
  });

  String? message;
  String? documentationUrl;

  factory ErrorMessage.fromJson(Map<String, dynamic> json) => ErrorMessage(
        message: json["message"],
        documentationUrl: json["documentation_url"],
      );

  Map<String, dynamic> toJson() => {
        "message": message,
        "documentation_url": documentationUrl,
      };
}
