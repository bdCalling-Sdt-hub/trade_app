import 'dart:convert';

class PackageModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  PackageModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PackageModel.fromRawJson(String str) => PackageModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PackageModel.fromJson(Map<String, dynamic> json) => PackageModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? [] : List<Datum>.from(json["data"]!.map((x) => Datum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "data": data == null ? [] : List<dynamic>.from(data!.map((x) => x.toJson())),
  };
}

class Datum {
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

  Datum({
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

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    planName: json["planName"],
    fee: json["fee"]?.toDouble(),
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
