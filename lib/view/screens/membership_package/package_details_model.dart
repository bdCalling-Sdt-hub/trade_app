import 'dart:convert';

class PackageDetailsModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  PackageDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PackageDetailsModel.fromRawJson(String str) => PackageDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PackageDetailsModel.fromJson(Map<String, dynamic> json) => PackageDetailsModel(
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
  String? planName;
  double? fee;
  int? pointRangeStart;
  int? pointRangeEnd;
  int? swapPoint;
  int? positiveCommentPoint;
  int? negativeCommentPoint;
  dynamic duration;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Data({
    this.id,
    this.planName,
    this.fee,
    this.pointRangeStart,
    this.pointRangeEnd,
    this.swapPoint,
    this.positiveCommentPoint,
    this.negativeCommentPoint,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    planName: json["planName"],
    fee: (json["fee"] as num?)?.toDouble(),
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
    swapPoint: json["swapPoint"],
    positiveCommentPoint: json["positiveCommentPoint"],
    negativeCommentPoint: json["negativeCommentPoint"],
    duration: json["duration"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "planName": planName,
    "fee": fee,
    "pointRangeStart": pointRangeStart,
    "pointRangeEnd": pointRangeEnd,
    "swapPoint": swapPoint,
    "positiveCommentPoint": positiveCommentPoint,
    "negativeCommentPoint": negativeCommentPoint,
    "duration": duration,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
