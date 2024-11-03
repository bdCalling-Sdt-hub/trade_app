import 'dart:convert';

class TermsConditionModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  TermsConditionModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory TermsConditionModel.fromRawJson(String str) => TermsConditionModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TermsConditionModel.fromJson(Map<String, dynamic> json) => TermsConditionModel(
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
  String? description;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? dataId;

  Data({
    this.id,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.dataId,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    id: json["_id"],
    description: json["description"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    dataId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "description": description,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": dataId,
  };
}
