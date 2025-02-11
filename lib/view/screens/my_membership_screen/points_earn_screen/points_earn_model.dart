import 'dart:convert';

class PointsEarnModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  PointsEarnModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PointsEarnModel.fromRawJson(String str) => PointsEarnModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PointsEarnModel.fromJson(Map<String, dynamic> json) => PointsEarnModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data?.toJson(),
  };
}

class Data {
  String? id;
  String? user;
  int? v;
  DateTime? createdAt;
  List<Detail>? details;
  int? points;
  DateTime? updatedAt;

  Data({
    this.id,
    this.user,
    this.v,
    this.createdAt,
    this.details,
    this.points,
    this.updatedAt,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    user: json["user"],
    v: json["__v"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    details: json["details"] == null ? [] : List<Detail>.from(json["details"]!.map((x) => Detail.fromJson(x))),
    points: json["points"],
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "__v": v,
    "createdAt": createdAt?.toIso8601String(),
    "details": details == null ? [] : List<dynamic>.from(details!.map((x) => x.toJson())),
    "points": points,
    "updatedAt": updatedAt?.toIso8601String(),
  };
}

class Detail {
  String? title;
  int? point;
  DateTime? date;
  String? id;

  Detail({
    this.title,
    this.point,
    this.date,
    this.id,
  });

  factory Detail.fromRawJson(String str) => Detail.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Detail.fromJson(Map<String, dynamic> json) => Detail(
    title: json["title"],
    point: json["point"],
    date: json["date"] == null ? null : DateTime.parse(json["date"]),
    id: json["_id"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "point": point,
    "date": date?.toIso8601String(),
    "_id": id,
  };
}
