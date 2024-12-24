class SearchesModel {
  final int? statusCode;
  final bool? success;
  final String? message;
  final Meta? meta;
  final List<SearchList>? data;

  SearchesModel({
    this.statusCode,
    this.success,
    this.message,
    this.meta,
    this.data,
  });

  factory SearchesModel.fromJson(Map<String, dynamic> json) => SearchesModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    data: json["data"] == null ? [] : List<SearchList>.from(json["data"]!.map((x) => SearchList.fromJson(x))),
  );

}

class SearchList {
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

  SearchList({
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
  });

  factory SearchList.fromJson(Map<String, dynamic> json) => SearchList(
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
  );

}

class Meta {
  final int? page;
  final int? limit;
  final int? total;
  final int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

}
