import 'dart:convert';

class TopProductModel {
  int? statusCode;
  bool? success;
  String? message;
  List<JustForYouDatum>? justForYouData;

  TopProductModel({
    this.statusCode,
    this.success,
    this.message,
    this.justForYouData,
  });

  factory TopProductModel.fromRawJson(String str) => TopProductModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory TopProductModel.fromJson(Map<String, dynamic> json) => TopProductModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    justForYouData: json["justForYouData"] == null ? [] : List<JustForYouDatum>.from(json["justForYouData"]!.map((x) => JustForYouDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "justForYouData": justForYouData == null ? [] : List<dynamic>.from(justForYouData!.map((x) => x.toJson())),
  };
}

class JustForYouDatum {
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
  int? v;

  JustForYouDatum({
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
    this.v,
  });

  factory JustForYouDatum.fromRawJson(String str) => JustForYouDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory JustForYouDatum.fromJson(Map<String, dynamic> json) => JustForYouDatum(
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
    v: json["__v"],
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
    "__v": v,
  };
}
