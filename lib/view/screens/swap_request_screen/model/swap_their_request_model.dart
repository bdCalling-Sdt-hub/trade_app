import 'dart:convert';

class SwapTheirReqModel {
  int? statusCode;
  bool? success;
  String? message;
  List<SwapTheirDatum>? swapTheirData;

  SwapTheirReqModel({
    this.statusCode,
    this.success,
    this.message,
    this.swapTheirData,
  });

  factory SwapTheirReqModel.fromRawJson(String str) => SwapTheirReqModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwapTheirReqModel.fromJson(Map<String, dynamic> json) => SwapTheirReqModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    swapTheirData: json["swapTheirData"] == null ? [] : List<SwapTheirDatum>.from(json["swapTheirData"]!.map((x) => SwapTheirDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "swapTheirData": swapTheirData == null ? [] : List<dynamic>.from(swapTheirData!.map((x) => x.toJson())),
  };
}

class SwapTheirDatum {
  String? id;
  User? userFrom;
  User? userTo;
  Product? productFrom;
  Product? productTo;
  String? isApproved;
  List<dynamic>? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  SwapTheirDatum({
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
  });

  factory SwapTheirDatum.fromRawJson(String str) => SwapTheirDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwapTheirDatum.fromJson(Map<String, dynamic> json) => SwapTheirDatum(
    id: json["_id"],
    userFrom: json["userFrom"] == null ? null : User.fromJson(json["userFrom"]),
    userTo: json["userTo"] == null ? null : User.fromJson(json["userTo"]),
    productFrom: json["productFrom"] == null ? null : Product.fromJson(json["productFrom"]),
    productTo: json["productTo"] == null ? null : Product.fromJson(json["productTo"]),
    isApproved: json["isApproved"],
    ratting: json["ratting"] == null ? [] : List<dynamic>.from(json["ratting"]!.map((x) => x)),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "userFrom": userFrom?.toJson(),
    "userTo": userTo?.toJson(),
    "productFrom": productFrom?.toJson(),
    "productTo": productTo?.toJson(),
    "isApproved": isApproved,
    "ratting": ratting == null ? [] : List<dynamic>.from(ratting!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Product {
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

class User {
  String? id;
  String? name;
  String? email;
  String? phoneNumber;
  int? points;
  String? role;
  String? userType;
  String? profileImage;
  String? coverImage;
  bool? isPaid;
  String? activationCode;
  bool? isBlock;
  bool? isActive;
  bool? isApproved;
  bool? isSubscribed;
  DateTime? expirationTime;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? address;
  String? country;
  String? zip;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.points,
    this.role,
    this.userType,
    this.profileImage,
    this.coverImage,
    this.isPaid,
    this.activationCode,
    this.isBlock,
    this.isActive,
    this.isApproved,
    this.isSubscribed,
    this.expirationTime,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.address,
    this.country,
    this.zip,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    points: json["points"],
    role: json["role"],
    userType: json["userType"],
    profileImage: json["profile_image"],
    coverImage: json["cover_image"],
    isPaid: json["isPaid"],
    activationCode: json["activationCode"],
    isBlock: json["is_block"],
    isActive: json["isActive"],
    isApproved: json["isApproved"],
    isSubscribed: json["isSubscribed"],
    expirationTime: json["expirationTime"] == null ? null : DateTime.parse(json["expirationTime"]),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    address: json["address"],
    country: json["country"],
    zip: json["zip"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "phone_number": phoneNumber,
    "points": points,
    "role": role,
    "userType": userType,
    "profile_image": profileImage,
    "cover_image": coverImage,
    "isPaid": isPaid,
    "activationCode": activationCode,
    "is_block": isBlock,
    "isActive": isActive,
    "isApproved": isApproved,
    "isSubscribed": isSubscribed,
    "expirationTime": expirationTime?.toIso8601String(),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "address": address,
    "country": country,
    "zip": zip,
  };
}
