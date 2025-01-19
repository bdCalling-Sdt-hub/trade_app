
class MemberShipProfileModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Data? data;

  MemberShipProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory MemberShipProfileModel.fromJson(Map<String, dynamic> json) => MemberShipProfileModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  final Profile? profile;
  final Plan? plan;
  final int? point;
  final List<PlanePoint>? planePoint;

  Data({
    this.profile,
    this.plan,
    this.point,
    this.planePoint,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    plan: json["plan"] == null ? null : Plan.fromJson(json["plan"]),
    point: json["point"],
    planePoint: json["planePoint"] == null ? [] : List<PlanePoint>.from(json["planePoint"]!.map((x) => PlanePoint.fromJson(x))),
  );

}

class Plan {
  final String? id;
  final PlanId? planId;
  final int? amount;
  final DateTime? planStartDate;
  final DateTime? planEndDate;
  final String? planType;
  final String? status;
  final String? name;
  final String? email;

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

}

class PlanId {
  final String? id;
  final String? planName;
  final double? fee;
  final int? pointRangeStart;
  final int? pointRangeEnd;
  final int? swapPoint;
  final int? positiveCommentPoint;
  final int? negativeCommentPoint;
  final int? productPriceLimit;
  final dynamic duration;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;

  PlanId({
    this.id,
    this.planName,
    this.fee,
    this.pointRangeStart,
    this.pointRangeEnd,
    this.swapPoint,
    this.positiveCommentPoint,
    this.negativeCommentPoint,
    this.productPriceLimit,
    this.duration,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory PlanId.fromJson(Map<String, dynamic> json) => PlanId(
    id: json["_id"],
    planName: json["planName"],
    fee: json["fee"]?.toDouble(),
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
    swapPoint: json["swapPoint"],
    positiveCommentPoint: json["positiveCommentPoint"],
    negativeCommentPoint: json["negativeCommentPoint"],
    productPriceLimit: json["productPriceLimit"],
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
    "productPriceLimit": productPriceLimit,
    "duration": duration,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class PlanePoint {
  final String? id;
  final String? planName;
  final int? pointRangeStart;
  final int? pointRangeEnd;

  PlanePoint({
    this.id,
    this.planName,
    this.pointRangeStart,
    this.pointRangeEnd,
  });

  factory PlanePoint.fromJson(Map<String, dynamic> json) => PlanePoint(
    id: json["_id"],
    planName: json["planName"],
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
  );

}

class Profile {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final int? points;
  final String? role;
  final String? userType;
  final String? profileImage;
  final String? coverImage;
  final bool? isPaid;
  final String? activationCode;
  final bool? isBlock;
  final bool? isActive;
  final bool? isApproved;
  final bool? isSubscribed;
  final DateTime? expirationTime;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? deviceToken;
  final DateTime? planExpatDate;

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
    this.deviceToken,
    this.planExpatDate,
  });

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
    deviceToken: json["deviceToken"],
    planExpatDate: json["planExpatDate"] == null ? null : DateTime.parse(json["planExpatDate"]),
  );

}
