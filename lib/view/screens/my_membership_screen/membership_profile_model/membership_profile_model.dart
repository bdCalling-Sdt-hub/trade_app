import 'dart:convert';

class MemberShipProfileModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  MemberShipProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory MemberShipProfileModel.fromRawJson(String str) => MemberShipProfileModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberShipProfileModel.fromJson(Map<String, dynamic> json) => MemberShipProfileModel(
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
  Plan? plan;
  int? point;

  Data({
    this.profile,
    this.plan,
    this.point,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "profile": profile?.toJson(),
    "plan": plan?.toJson(),
    "point": point,
  };
}

class Plan {
  String? id;
  PlanId? planId;
  int? amount;
  DateTime? planStartDate;
  DateTime? planEndDate;
  String? planType;
  String? status;
  String? name;
  String? email;

  Plan({
    this.id,
    this.planId,
    this.amount,
    this.planStartDate,
    this.planEndDate,
    this.planType,
    this.status,
    this.name,
    this.email,
  });

  factory Plan.fromRawJson(String str) => Plan.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
    id: json["_id"],
    planId: json["plan_id"] == null ? null : PlanId.fromJson(json["plan_id"]),
    amount: json["amount"],
    planStartDate: json["planStartDate"] == null ? null : DateTime.parse(json["planStartDate"]),
    planEndDate: json["planEndDate"] == null ? null : DateTime.parse(json["planEndDate"]),
    planType: json["plan_type"],
    status: json["status"],
    name: json["name"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "plan_id": planId?.toJson(),
    "amount": amount,
    "planStartDate": planStartDate?.toIso8601String(),
    "planEndDate": planEndDate?.toIso8601String(),
    "plan_type": planType,
    "status": status,
    "name": name,
    "email": email,
  };
}

class PlanId {
  String? id;
  String? planName;
  int? fee;
  int? pointRangeStart;
  int? pointRangeEnd;
  int? swapPoint;
  int? positiveCommentPoint;
  int? negativeCommentPoint;
  dynamic duration;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  PlanId({
    this.id,
    this.planName,
    this.fee,
    this.pointRangeStart,
    this.pointRangeEnd,
    this.swapPoint,
    this.positiveCommentPoint,
    this.negativeCommentPoint,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PlanId.fromRawJson(String str) => PlanId.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
    id: json["_id"],
    planName: json["planName"],
    fee: json["fee"],
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
    swapPoint: json["swapPoint"],
    positiveCommentPoint: json["positiveCommentPoint"],
    negativeCommentPoint: json["negativeCommentPoint"],
    duration: json["duration"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "planName": planName,
    "fee": fee,
    "pointRangeStart": pointRangeStart,
    "pointRangeEnd": pointRangeEnd,
    "swapPoint": swapPoint,
    "positiveCommentPoint": positiveCommentPoint,
    "negativeCommentPoint": negativeCommentPoint,
    "duration": duration,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
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
  String? address;
  String? country;
  String? zip;
  DateTime? planExpatDate;

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
    this.address,
    this.country,
    this.zip,
    this.planExpatDate,
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
