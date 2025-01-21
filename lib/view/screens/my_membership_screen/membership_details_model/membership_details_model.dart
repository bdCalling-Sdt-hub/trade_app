
class MemberShipDetailsModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Data? data;

  MemberShipDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory MemberShipDetailsModel.fromJson(Map<String, dynamic> json) => MemberShipDetailsModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

}

class Data {
  final List<Result>? result;
  final int? pointRangeStart;
  final int? pointRangeEnd;
  final int? userPoint;

  Data({
    this.result,
    this.pointRangeStart,
    this.pointRangeEnd,
    this.userPoint,
  });

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
    userPoint: json["userPoint"],
  );

}

class Result {
  final String? swapId;
  final int? myPoints;
  final Product? productFrom;
  final Product? productTo;
  final String? planType;
  final String? isApproved;
  final DateTime? createdAt;

  Result({
    this.swapId,
    this.myPoints,
    this.productFrom,
    this.productTo,
    this.planType,
    this.isApproved,
    this.createdAt,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    swapId: json["swapId"],
    myPoints: json["myPoints"],
    productFrom: json["productFrom"] == null ? null : Product.fromJson(json["productFrom"]),
    productTo: json["productTo"] == null ? null : Product.fromJson(json["productTo"]),
    planType: json["planType"],
    isApproved: json["isApproved"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
  );

}

class Product {
  final String? id;
  final Category? category;
  final SubCategory? subCategory;
  final User? user;
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
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["subCategory"] == null ? null : SubCategory.fromJson(json["subCategory"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
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

class Category {
  final String? id;
  final String? name;
  final String? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["_id"],
    name: json["name"],
    image: json["image"],
  );

}

class SubCategory {
  final String? id;
  final String? name;

  SubCategory({
    this.id,
    this.name,
  });

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: json["_id"],
    name: json["name"],
  );

}

class User {
  final String? id;
  final String? name;
  final String? email;
  final String? phoneNumber;
  final String? profileImage;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    profileImage: json["profile_image"],
  );

}
