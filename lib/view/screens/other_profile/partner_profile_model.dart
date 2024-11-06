import 'dart:convert';

class PartnerProfileModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  PartnerProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PartnerProfileModel.fromRawJson(String str) => PartnerProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PartnerProfileModel.fromJson(Map<String, dynamic> json) => PartnerProfileModel(
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
  Profile? profile;
  List<dynamic>? product;
  List<Ratting>? ratting;
  double? averageRating;

  Data({
    this.profile,
    this.product,
    this.ratting,
    this.averageRating,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    product: json["product"] == null ? [] : List<dynamic>.from(json["product"]!.map((x) => x)),
    ratting: json["ratting"] == null ? [] : List<Ratting>.from(json["ratting"]!.map((x) => Ratting.fromJson(x))),
    averageRating: (json["average_rating"] as num?)?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "profile": profile?.toJson(),
    "product": product == null ? [] : List<dynamic>.from(product!.map((x) => x)),
    "ratting": ratting == null ? [] : List<dynamic>.from(ratting!.map((x) => x.toJson())),
    "average_rating": averageRating,
  };
}

class Profile {
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

  Profile({
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
  });

  factory Profile.fromRawJson(String str) => Profile.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Profile.fromJson(Map<String, dynamic> json) => Profile(
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
  };
}

class Ratting {
  String? id;
  Profile? user;
  Swap? swap;
  Profile? swapOwner;
  String? comment;
  double? ratting;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  Ratting({
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

  factory Ratting.fromRawJson(String str) => Ratting.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Ratting.fromJson(Map<String, dynamic> json) => Ratting(
    id: json["_id"],
    user: json["user"] == null ? null : Profile.fromJson(json["user"]),
    swap: json["swap"] == null ? null : Swap.fromJson(json["swap"]),
    swapOwner: json["swapOwner"] == null ? null : Profile.fromJson(json["swapOwner"]),
    comment: json["comment"],
    ratting: (json["ratting"] is int ? (json["ratting"] as int).toDouble() : json["ratting"]) as double?,
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
