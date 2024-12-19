import 'dart:convert';

class MemberShipDetailsModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  MemberShipDetailsModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory MemberShipDetailsModel.fromRawJson(String str) => MemberShipDetailsModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory MemberShipDetailsModel.fromJson(Map<String, dynamic> json) => MemberShipDetailsModel(
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
  List<Result>? result;
  int? pointRangeStart;
  int? pointRangeEnd;
  int? userPoint;

  Data({
    this.result,
    this.pointRangeStart,
    this.pointRangeEnd,
    this.userPoint,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    result: json["result"] == null ? [] : List<Result>.from(json["result"]!.map((x) => Result.fromJson(x))),
    pointRangeStart: json["pointRangeStart"],
    pointRangeEnd: json["pointRangeEnd"],
    userPoint: json["userPoint"],
  );

  Map<String, dynamic> toJson() => {
    "result": result == null ? [] : List<dynamic>.from(result!.map((x) => x.toJson())),
    "pointRangeStart": pointRangeStart,
    "pointRangeEnd": pointRangeEnd,
    "userPoint": userPoint,
  };
}

class Result {
  String? swapId;
  int? myPoints;
  Product? productFrom;
  Product? productTo;
  String? planType;
  String? isApproved;

  Result({
    this.swapId,
    this.myPoints,
    this.productFrom,
    this.productTo,
    this.planType,
    this.isApproved,
  });

  factory Result.fromRawJson(String str) => Result.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    swapId: json["swapId"],
    myPoints: json["myPoints"],
    productFrom: json["productFrom"] == null ? null : Product.fromJson(json["productFrom"]),
    productTo: json["productTo"] == null ? null : Product.fromJson(json["productTo"]),
    planType: json["planType"],
    isApproved: json["isApproved"],
  );

  Map<String, dynamic> toJson() => {
    "swapId": swapId,
    "myPoints": myPoints,
    "productFrom": productFrom?.toJson(),
    "productTo": productTo?.toJson(),
    "planType": planType,
    "isApproved": isApproved,
  };
}

class Product {
  ProductFromId? id;
  Category? category;
  SubCategory? subCategory;
  User? user;
  String? title;
  Condition? condition;
  Description? description;
  int? productValue;
  ProductFromAddress? address;
  List<String>? images;
  int? v;
  String? status;

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
    this.status,
  });

  factory Product.fromRawJson(String str) => Product.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: productFromIdValues.map[json["_id"]]!,
    category: json["category"] == null ? null : Category.fromJson(json["category"]),
    subCategory: json["subCategory"] == null ? null : SubCategory.fromJson(json["subCategory"]),
    user: json["user"] == null ? null : User.fromJson(json["user"]),
    title: json["title"]!,
    condition: conditionValues.map[json["condition"]]!,
    description: descriptionValues.map[json["description"]]!,
    productValue: json["productValue"],
    address: productFromAddressValues.map[json["address"]]!,
    images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
    v: json["__v"],
    status: json["status"],
  );

  Map<String, dynamic> toJson() => {
    "_id": productFromIdValues.reverse[id],
    "category": category?.toJson(),
    "subCategory": subCategory?.toJson(),
    "user": user?.toJson(),
    "title": title,
    "condition": conditionValues.reverse[condition],
    "description": descriptionValues.reverse[description],
    "productValue": productValue,
    "address": productFromAddressValues.reverse[address],
    "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
    "__v": v,
    "status": status,
  };
}

enum ProductFromAddress {
  DHAKA
}

final productFromAddressValues = EnumValues({
  "Dhaka": ProductFromAddress.DHAKA
});

class Category {
  CategoryId? id;
  CategoryName? name;
  Image? image;

  Category({
    this.id,
    this.name,
    this.image,
  });

  factory Category.fromRawJson(String str) => Category.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: categoryIdValues.map[json["_id"]]!,
    name: categoryNameValues.map[json["name"]]!,
    image: imageValues.map[json["image"]]!,
  );

  Map<String, dynamic> toJson() => {
    "_id": categoryIdValues.reverse[id],
    "name": categoryNameValues.reverse[name],
    "image": imageValues.reverse[image],
  };
}

enum CategoryId {
  THE_66_E51_B7_E4127_AAA606943831
}

final categoryIdValues = EnumValues({
  "66e51b7e4127aaa606943831": CategoryId.THE_66_E51_B7_E4127_AAA606943831
});

enum Image {
  IMAGES_IMAGE_1728895232375_IMAGE_11_PNG
}

final imageValues = EnumValues({
  "/images/image/1728895232375-image (11).png": Image.IMAGES_IMAGE_1728895232375_IMAGE_11_PNG
});

enum CategoryName {
  KEYBORD
}

final categoryNameValues = EnumValues({
  "Keybord": CategoryName.KEYBORD
});

enum Condition {
  NEW,
  OLD
}

final conditionValues = EnumValues({
  "new": Condition.NEW,
  "old": Condition.OLD
});

enum Description {
  AMUZING_PRODUCT,
  GOOD
}

final descriptionValues = EnumValues({
  "amuzing product": Description.AMUZING_PRODUCT,
  "Good": Description.GOOD
});

enum ProductFromId {
  THE_6728_BBB8_EADC768_CB83_CD447,
  THE_6728_BC26_EADC768_CB83_CD90_D,
  THE_672_B00_A28_E5_C6_C398_B0_AA160
}

final productFromIdValues = EnumValues({
  "6728bbb8eadc768cb83cd447": ProductFromId.THE_6728_BBB8_EADC768_CB83_CD447,
  "6728bc26eadc768cb83cd90d": ProductFromId.THE_6728_BC26_EADC768_CB83_CD90_D,
  "672b00a28e5c6c398b0aa160": ProductFromId.THE_672_B00_A28_E5_C6_C398_B0_AA160
});

class SubCategory {
  SubCategoryId? id;
  SubCategoryName? name;

  SubCategory({
    this.id,
    this.name,
  });

  factory SubCategory.fromRawJson(String str) => SubCategory.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SubCategory.fromJson(Map<String, dynamic> json) => SubCategory(
    id: subCategoryIdValues.map[json["_id"]]!,
    name: subCategoryNameValues.map[json["name"]]!,
  );

  Map<String, dynamic> toJson() => {
    "_id": subCategoryIdValues.reverse[id],
    "name": subCategoryNameValues.reverse[name],
  };
}

enum SubCategoryId {
  THE_670_E4_ACCC8_C8878_E72_F0_D22_A
}

final subCategoryIdValues = EnumValues({
  "670e4accc8c8878e72f0d22a": SubCategoryId.THE_670_E4_ACCC8_C8878_E72_F0_D22_A
});

enum SubCategoryName {
  A4
}

final subCategoryNameValues = EnumValues({
  "A4": SubCategoryName.A4
});

enum Title {
  NADIMIAN,
  PARTNER_PRODUCT,
  SOHEBIAN
}

final titleValues = EnumValues({
  "Nadimian": Title.NADIMIAN,
  "partner product": Title.PARTNER_PRODUCT,
  "sohebian": Title.SOHEBIAN
});

class User {
  UserId? id;
  UserName? name;
  Email? email;
  String? phoneNumber;
  String? profileImage;
  UserAddress? address;

  User({
    this.id,
    this.name,
    this.email,
    this.phoneNumber,
    this.profileImage,
    this.address,
  });

  factory User.fromRawJson(String str) => User.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: userIdValues.map[json["_id"]]!,
    name: userNameValues.map[json["name"]]!,
    email: emailValues.map[json["email"]]!,
    phoneNumber: json["phone_number"],
    profileImage: json["profile_image"],
    address: userAddressValues.map[json["address"]]!,
  );

  Map<String, dynamic> toJson() => {
    "_id": userIdValues.reverse[id],
    "name": userNameValues.reverse[name],
    "email": emailValues.reverse[email],
    "phone_number": phoneNumber,
    "profile_image": profileImage,
    "address": userAddressValues.reverse[address],
  };
}

enum UserAddress {
  BANASREE,
  WSDFGHN
}

final userAddressValues = EnumValues({
  "Banasree": UserAddress.BANASREE,
  "wsdfghn": UserAddress.WSDFGHN
});

enum Email {
  RETEV81494_EVASUD_COM,
  SOMAHI8872_ALEITAR_COM
}

final emailValues = EnumValues({
  "retev81494@evasud.com": Email.RETEV81494_EVASUD_COM,
  "somahi8872@aleitar.com": Email.SOMAHI8872_ALEITAR_COM
});

enum UserId {
  THE_672718_A40_FB17_B271_D8_E5564,
  THE_672895_AEB6_B8_F42_FBF6_F8927
}

final userIdValues = EnumValues({
  "672718a40fb17b271d8e5564": UserId.THE_672718_A40_FB17_B271_D8_E5564,
  "672895aeb6b8f42fbf6f8927": UserId.THE_672895_AEB6_B8_F42_FBF6_F8927
});

enum UserName {
  DJ_KHAN,
  HASAN
}

final userNameValues = EnumValues({
  "Dj Khan ": UserName.DJ_KHAN,
  "Hasan": UserName.HASAN
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
