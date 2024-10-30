import 'dart:convert';

class ProductDetailsModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  ProductDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory ProductDetailsModel.fromRawJson(String str) => ProductDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ProductDetailsModel.fromJson(Map<String, dynamic> json) => ProductDetailsModel(
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
  Product? product;
  List<SimilarProduct>? similarProduct;
  int? point;

  Data({
    this.product,
    this.similarProduct,
    this.point,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    product: json["product"] == null ? null : Product.fromJson(json["product"]),
    similarProduct: json["similarProduct"] == null ? [] : List<SimilarProduct>.from(json["similarProduct"]!.map((x) => SimilarProduct.fromJson(x))),
    point: json["point"],
  );

  Map<String, dynamic> toJson() => {
    "product": product?.toJson(),
    "similarProduct": similarProduct == null ? [] : List<dynamic>.from(similarProduct!.map((x) => x.toJson())),
    "point": point,
  };
}

class Product {
  String? id;
  CategoryClass? category;
  CategoryClass? subCategory;
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
    category: json["category"] == null ? null : CategoryClass.fromJson(json["category"]),
    subCategory: json["subCategory"] == null ? null : CategoryClass.fromJson(json["subCategory"]),
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

class CategoryClass {
  String? id;
  String? name;

  CategoryClass({
    this.id,
    this.name,
  });

  factory CategoryClass.fromRawJson(String str) => CategoryClass.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory CategoryClass.fromJson(Map<String, dynamic> json) => CategoryClass(
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
  DateTime? planExpatDate;

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
    this.planExpatDate,
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
    "planExpatDate": planExpatDate?.toIso8601String(),
  };
}

class SimilarProduct {
  String? id;
  CategoryEnum? category;
  SubCategory? subCategory;
  String? user;
  String? title;
  String? condition;
  String? description;
  int? productValue;
  String? address;
  List<String>? images;
  int? v;

  SimilarProduct({
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

  factory SimilarProduct.fromRawJson(String str) => SimilarProduct.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SimilarProduct.fromJson(Map<String, dynamic> json) => SimilarProduct(
    id: json["_id"],
    category: categoryEnumValues.map[json["category"]]!,
    subCategory: subCategoryValues.map[json["subCategory"]]!,
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
    "category": categoryEnumValues.reverse[category],
    "subCategory": subCategoryValues.reverse[subCategory],
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

enum CategoryEnum {
  THE_66_E51_B7_E4127_AAA606943831
}

final categoryEnumValues = EnumValues({
  "66e51b7e4127aaa606943831": CategoryEnum.THE_66_E51_B7_E4127_AAA606943831
});

enum SubCategory {
  THE_670_E4_ACCC8_C8878_E72_F0_D22_A
}

final subCategoryValues = EnumValues({
  "670e4accc8c8878e72f0d22a": SubCategory.THE_670_E4_ACCC8_C8878_E72_F0_D22_A
});

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
