import 'dart:convert';

class MyRatingModel {
  int? statusCode;
  bool? success;
  String? message;
  List<MyRatingDatum>? myRatingData;

  MyRatingModel({
    this.statusCode,
    this.success,
    this.message,
    this.myRatingData,
  });

  factory MyRatingModel.fromRawJson(String str) => MyRatingModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyRatingModel.fromJson(Map<String, dynamic> json) => MyRatingModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    myRatingData: json["myRatingData"] == null ? [] : List<MyRatingDatum>.from(json["myRatingData"]!.map((x) => MyRatingDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "myRatingData": myRatingData == null ? [] : List<dynamic>.from(myRatingData!.map((x) => x.toJson())),
  };
}

class MyRatingDatum {
  String? id;
  SwapOwner? user;
  Swap? swap;
  SwapOwner? swapOwner;
  String? comment;
  double? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  MyRatingDatum({
    this.id,
    this.user,
    this.swap,
    this.swapOwner,
    this.comment,
    this.ratting,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory MyRatingDatum.fromRawJson(String str) => MyRatingDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MyRatingDatum.fromJson(Map<String, dynamic> json) => MyRatingDatum(
    id: json["_id"],
    user: json["user"] == null ? null : SwapOwner.fromJson(json["user"]),
    swap: json["swap"] == null ? null : Swap.fromJson(json["swap"]),
    swapOwner: json["swapOwner"] == null ? null : SwapOwner.fromJson(json["swapOwner"]),
    comment: json["comment"],
    ratting: json["ratting"]?.toDouble(),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "user": user?.toJson(),
    "swap": swap?.toJson(),
    "swapOwner": swapOwner?.toJson(),
    "comment": comment,
    "ratting": ratting,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Swap {
  String? id;
  String? userFrom;
  String? userTo;
  String? productFrom;
  String? productTo;
  String? isApproved;
  List<String>? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  int? swapUserFromPoint;
  int? swapUserToPoint;

  Swap({
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

  factory Swap.fromRawJson(String str) => Swap.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Swap.fromJson(Map<String, dynamic> json) => Swap(
    id: json["_id"],
    userFrom: json["userFrom"],
    userTo: json["userTo"],
    productFrom: json["productFrom"],
    productTo: json["productTo"],
    isApproved: json["isApproved"],
    ratting: json["ratting"] == null ? [] : List<String>.from(json["ratting"]!.map((x) => x)),
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
    "productFrom": productFrom,
    "productTo": productTo,
    "isApproved": isApproved,
    "ratting": ratting == null ? [] : List<dynamic>.from(ratting!.map((x) => x)),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "swapUserFromPoint": swapUserFromPoint,
    "swapUserToPoint": swapUserToPoint,
  };
}

class SwapOwner {
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

  SwapOwner({
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

  factory SwapOwner.fromRawJson(String str) => SwapOwner.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SwapOwner.fromJson(Map<String, dynamic> json) => SwapOwner(
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
