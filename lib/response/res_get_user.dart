// To parse this JSON data, do
//
//     final resGetUser = resGetUserFromJson(jsonString);

import 'dart:convert';

import '../models/user.dart';

ResGetUser resGetUserFromJson(String str) =>
    ResGetUser.fromJson(json.decode(str));

String resGetUserToJson(ResGetUser data) => json.encode(data.toJson());

class ResGetUser {
  ResGetUser({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  int? page;
  int? perPage;
  int? total;
  int? totalPages;
  List<User>? data;
  Support? support;

  factory ResGetUser.fromJson(Map<String, dynamic> json) => ResGetUser(
        page: json["page"],
        perPage: json["per_page"],
        total: json["total"],
        totalPages: json["total_pages"],
        data: json["data"] == null
            ? null
            : List<User>.from(json["data"].map((x) => User.fromJson(x))),
        support:
            json["support"] == null ? null : Support.fromJson(json["support"]),
      );

  Map<String, dynamic> toJson() => {
        "page": page,
        "per_page": perPage,
        "total": total,
        "total_pages": totalPages,
        "data": data == null
            ? null
            : List<dynamic>.from(data!.map((x) => x.toJson())),
        "support": support == null ? null : support!.toJson(),
      };
}

class Support {
  Support({
    this.url,
    this.text,
  });

  String? url;
  String? text;

  factory Support.fromJson(Map<String, dynamic> json) => Support(
        url: json["url"],
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
        "text": text,
      };
}
