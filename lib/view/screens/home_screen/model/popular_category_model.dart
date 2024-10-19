import 'dart:convert';

class PopularCategoryModel {
  int? statusCode;
  bool? success;
  String? message;
  List<CategoryDatum>? categoryData;

  PopularCategoryModel({
    this.statusCode,
    this.success,
    this.message,
    this.categoryData,
  });

  factory PopularCategoryModel.fromRawJson(String str) => PopularCategoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PopularCategoryModel.fromJson(Map<String, dynamic> json) => PopularCategoryModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    categoryData: json["categoryData"] == null ? [] : List<CategoryDatum>.from(json["categoryData"]!.map((x) => CategoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "categoryData": categoryData == null ? [] : List<dynamic>.from(categoryData!.map((x) => x.toJson())),
  };
}

class CategoryDatum {
  String? id;
  String? name;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  CategoryDatum({
    this.id,
    this.name,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory CategoryDatum.fromRawJson(String str) => CategoryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryDatum.fromJson(Map<String, dynamic> json) => CategoryDatum(
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
