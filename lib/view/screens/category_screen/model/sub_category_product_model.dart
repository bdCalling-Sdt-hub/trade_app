import 'dart:convert';

class SubCategoryProductModel {
  int? statusCode;
  bool? success;
  String? message;
  Meta? meta;
  List<SubProductDatum>? subProductData;

  SubCategoryProductModel({
    this.statusCode,
    this.success,
    this.message,
    this.meta,
    this.subProductData,
  });

  factory SubCategoryProductModel.fromRawJson(String str) => SubCategoryProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategoryProductModel.fromJson(Map<String, dynamic> json) => SubCategoryProductModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    subProductData: json["subProductData"] == null ? [] : List<SubProductDatum>.from(json["subProductData"]!.map((x) => SubProductDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "meta": meta?.toJson(),
    "subProductData": subProductData == null ? [] : List<dynamic>.from(subProductData!.map((x) => x.toJson())),
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}

class SubProductDatum {
  String? id;
  String? category;
  String? subCategory;
  String? user;
  String? title;
  String? condition;
  String? description;
  int? productValue;
  String? address;
  List<String>? images;

  SubProductDatum({
    this.id,
    this.category,
    this.subCategory,
    this.user,
    this.title,
    this.condition,
    this.description,
    this.productValue,
    this.address,
    this.images,
  });

  factory SubProductDatum.fromRawJson(String str) => SubProductDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubProductDatum.fromJson(Map<String, dynamic> json) => SubProductDatum(
    id: json["_id"],
    category: json["category"],
    subCategory: json["subCategory"],
    user: json["user"],
    title: json["title"],
    condition: json["condition"],
    description: json["description"],
    productValue: json["productValue"],
    address: json["address"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "category": category,
    "subCategory": subCategory,
    "user": user,
    "title": title,
    "condition": condition,
    "description": description,
    "productValue": productValue,
    "address": address,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
  };
}
