class PartnerProfileModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Data? data;

  PartnerProfileModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory PartnerProfileModel.fromJson(Map<String, dynamic> json) => PartnerProfileModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  final Profile? profile;
  final List<Product>? product;
  final List<dynamic>? ratting;
  final AverageRating? averageRating;

  Data({
    this.profile,
    this.product,
    this.ratting,
    this.averageRating,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    profile: json["profile"] == null ? null : Profile.fromJson(json["profile"]),
    product: json["product"] == null ? [] : List<Product>.from(json["product"]!.map((x) => Product.fromJson(x))),
    ratting: json["ratting"] == null ? [] : List<dynamic>.from(json["ratting"]!.map((x) => x)),
    averageRating: json["average_rating"] == null ? null : AverageRating.fromJson(json["average_rating"]),
  );

}

class AverageRating {
  final String? message;

  AverageRating({
    this.message,
  });

  factory AverageRating.fromJson(Map<String, dynamic> json) => AverageRating(
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "message": message,
  };
}

class Product {
  final String? id;
  final String? category;
  final String? subCategory;
  final String? user;
  final String? title;
  final String? condition;
  final String? description;
  final int? productValue;
  final String? status;
  final String? address;
  final List<String>? images;
  final int? v;

  Product({
    this.id,
    this.category,
    this.subCategory,
    this.user,
    this.title,
    this.condition,
    this.description,
    this.productValue,
    this.status,
    this.address,
    this.images,
    this.v,
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["_id"],
    category: json["category"],
    subCategory: json["subCategory"],
    user: json["user"],
    title: json["title"],
    condition: json["condition"],
    description: json["description"],
    productValue: json["productValue"],
    status: json["status"],
    address: json["address"],
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    v: json["__v"],
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
