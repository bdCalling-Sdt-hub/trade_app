import 'dart:convert';

class ProfileModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  ProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ProfileModel.fromRawJson(String str) => ProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
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
  Result? result;

  Data({
    this.result,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "result": result?.toJson(),
  };
}

class Result {
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
  DateTime? planExpatDate;

  Result({
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
    this.planExpatDate,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
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
    planExpatDate: json["planExpatDate"] == null ? null : DateTime.parse(json["planExpatDate"]),
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
    "planExpatDate": planExpatDate?.toIso8601String(),
  };
}
