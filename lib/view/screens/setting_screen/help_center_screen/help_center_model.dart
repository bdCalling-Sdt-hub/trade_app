import 'dart:convert';

class HelpCenterModel {
  int? statusCode;
  bool? success;
  String? message;
  List<Datum>? data;

  HelpCenterModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory HelpCenterModel.fromRawJson(String str) => HelpCenterModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory HelpCenterModel.fromJson(Map<String, dynamic> json) => HelpCenterModel(
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
  String? questions;
  String? answer;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? datumId;

  Datum({
    this.id,
    this.questions,
    this.answer,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Datum.fromJson(Map<String, dynamic> json) => Datum(
    id: json["_id"],
    questions: json["questions"],
    answer: json["answer"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    datumId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "questions": questions,
    "answer": answer,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": datumId,
  };
}
