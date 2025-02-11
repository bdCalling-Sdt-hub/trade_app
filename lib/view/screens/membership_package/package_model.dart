import 'dart:convert';

class PackageModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

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
  List<Subscription>? subscriptions;

  Data({
    this.subscriptions,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    subscriptions: json["subscriptions"] == null ? [] : List<Subscription>.from(json["subscriptions"]!.map((x) => Subscription.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "subscriptions": subscriptions == null ? [] : List<dynamic>.from(subscriptions!.map((x) => x.toJson())),
  };
}

class Subscription {
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
  dynamic hasUserPlan;

  Subscription({
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
    this.hasUserPlan,
  });

  factory Subscription.fromRawJson(String str) => Subscription.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Subscription.fromJson(Map<String, dynamic> json) => Subscription(
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
    hasUserPlan: json["hasUserPlan"],
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
    "hasUserPlan": hasUserPlan,
  };
}
