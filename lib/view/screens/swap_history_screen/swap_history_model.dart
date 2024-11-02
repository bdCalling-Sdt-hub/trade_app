import 'dart:convert';

class SwapHistoryModel {
  int? statusCode;
  bool? success;
  String? message;
  List<SwapHistoryDatum>? swapHistoryData;

  SwapHistoryModel({
    this.statusCode,
    this.success,
    this.message,
    this.swapHistoryData,
  });

  factory SwapHistoryModel.fromRawJson(String str) => SwapHistoryModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwapHistoryModel.fromJson(Map<String, dynamic> json) => SwapHistoryModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    swapHistoryData: json["swapHistoryData"] == null ? [] : List<SwapHistoryDatum>.from(json["swapHistoryData"]!.map((x) => SwapHistoryDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "swapHistoryData": swapHistoryData == null ? [] : List<dynamic>.from(swapHistoryData!.map((x) => x.toJson())),
  };
}

class SwapHistoryDatum {
  String? id;
  String? userFrom;
  String? userTo;
  Product? productFrom;
  Product? productTo;
  String? isApproved;
  List<dynamic>? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? swapUserFromPoint;
  int? swapUserToPoint;

  SwapHistoryDatum({
    this.id,
    this.userFrom,
    this.userTo,
    this.productFrom,
    this.productTo,
    this.isApproved,
    this.ratting,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.swapUserFromPoint,
    this.swapUserToPoint,
  });

  factory SwapHistoryDatum.fromRawJson(String str) => SwapHistoryDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwapHistoryDatum.fromJson(Map<String, dynamic> json) => SwapHistoryDatum(
    id: json["_id"],
    userFrom: json["userFrom"],
    userTo: json["userTo"],
    productFrom: json["productFrom"] == null ? null : Product.fromJson(json["productFrom"]),
    productTo: json["productTo"] == null ? null : Product.fromJson(json["productTo"]),
    isApproved: json["isApproved"],
    ratting: json["ratting"] == null ? [] : List<dynamic>.from(json["ratting"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    swapUserFromPoint: json["swapUserFromPoint"],
    swapUserToPoint: json["swapUserToPoint"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userFrom": userFrom,
    "userTo": userTo,
    "productFrom": productFrom?.toJson(),
    "productTo": productTo?.toJson(),
    "isApproved": isApproved,
    "ratting": ratting == null ? [] : List<dynamic>.from(ratting!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "swapUserFromPoint": swapUserFromPoint,
    "swapUserToPoint": swapUserToPoint,
  };
}

class Product {
  String? id;
  Category? category;
  SubCategory? subCategory;
  User? user;
  String? title;
  String? condition;
  String? description;
  int? productValue;
  String? address;
  List<String>? images;
  int? v;

  Product({
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

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["subCategory"] == null ? null : SubCategory.fromJson(json["subCategory"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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
    "category": category?.toJson(),
    "subCategory": subCategory?.toJson(),
    "user": user?.toJson(),
    "title": title,
    "condition": condition,
    "description": description,
    "productValue": productValue,
    "address": address,
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "__v": v,
  };
}

class Category {
  String? id;
  String? name;
  String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "image": image,
  };
}

class SubCategory {
  String? id;
  String? name;

  SubCategory({
    this.id,
    this.name,
  });

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}

class User {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  String? profileImage;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    profileImage: json["profile_image"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "profile_image": profileImage,
  };
}
