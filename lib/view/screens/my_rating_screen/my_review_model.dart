import 'dart:convert';

class MyRatingModel {
  int? statusCode;
  bool? success;
  String? message;
  List<MyRatingDatum>? myRatingData;

  MyRatingModel({
    this.statusCode,
    this.success,
    this.message,
    this.myRatingData,
  });

  factory MyRatingModel.fromRawJson(String str) => MyRatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyRatingModel.fromJson(Map<String, dynamic> json) => MyRatingModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    myRatingData: json["myRatingData"] == null ? [] : List<MyRatingDatum>.from(json["myRatingData"]!.map((x) => MyRatingDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "myRatingData": myRatingData == null ? [] : List<dynamic>.from(myRatingData!.map((x) => x.toJson())),
  };
}

class MyRatingDatum {
  String? id;
  String? user;
  String? swap;
  String? swapOwner;
  String? comment;
  double? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MyRatingDatum({
    this.id,
    this.user,
    this.swap,
    this.swapOwner,
    this.comment,
    this.ratting,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyRatingDatum.fromRawJson(String str) => MyRatingDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyRatingDatum.fromJson(Map<String, dynamic> json) => MyRatingDatum(
    id: json["_id"],
    user: json["user"],
    swap: json["swap"],
    swapOwner: json["swapOwner"],
    comment: json["comment"],
    ratting: json["ratting"]?.toDouble(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user,
    "swap": swap,
    "swapOwner": swapOwner,
    "comment": comment,
    "ratting": ratting,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
