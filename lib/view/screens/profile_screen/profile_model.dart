
class ProfileModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Data? data;

  ProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ProfileModel.fromJson(Map<String, dynamic> json) => ProfileModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  final Result? result;
  final DateTime? planStartDate;
  final DateTime? planEndDate;
  final int? ratting;
  final int? point;

  Data({
    this.result,
    this.planStartDate,
    this.planEndDate,
    this.ratting,
    this.point,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? null : Result.fromJson(json["result"]),
    planStartDate: json["planStartDate"] == null ? null : DateTime.parse(json["planStartDate"]),
    planEndDate: json["planEndDate"] == null ? null : DateTime.parse(json["planEndDate"]),
    ratting: json["ratting"],
    point: json["point"],
  );
}

class Result {
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
    this.deviceToken,
    this.planExpatDate,
  });

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
    deviceToken: json["deviceToken"],
    planExpatDate: json["planExpatDate"] == null ? null : DateTime.parse(json["planExpatDate"]),
  );
}
