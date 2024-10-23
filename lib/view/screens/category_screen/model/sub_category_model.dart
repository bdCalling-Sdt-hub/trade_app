import 'dart:convert';

class SubCategoryModel {
  int? statusCode;
  bool? success;
  String? message;
  List<SubDatum>? subData;

  SubCategoryModel({
    this.statusCode,
    this.success,
    this.message,
    this.subData,
  });

  factory SubCategoryModel.fromRawJson(String str) => SubCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) => SubCategoryModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    subData: json["subData"] == null ? [] : List<SubDatum>.from(json["subData"]!.map((x) => SubDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "subData": subData == null ? [] : List<dynamic>.from(subData!.map((x) => x.toJson())),
  };
}

class SubDatum {
  String? id;
  String? name;
  Category? category;
  String? swapLevel;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SubDatum({
    this.id,
    this.name,
    this.category,
    this.swapLevel,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory SubDatum.fromRawJson(String str) => SubDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubDatum.fromJson(Map<String, dynamic> json) => SubDatum(
    id: json["_id"],
    name: json["name"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    swapLevel: json["swapLevel"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "category": category?.toJson(),
    "swapLevel": swapLevel,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Category {
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Category({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
