import 'dart:convert';

class SliderModel {
  int? statusCode;
  bool? success;
  String? message;
  Meta? meta;
  List<SliderDatum>? sliderData;

  SliderModel({
    this.statusCode,
    this.success,
    this.message,
    this.meta,
    this.sliderData,
  });

  factory SliderModel.fromRawJson(String str) => SliderModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
    sliderData: json["sliderData"] == null ? [] : List<SliderDatum>.from(json["sliderData"]!.map((x) => SliderDatum.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "meta": meta?.toJson(),
    "sliderData": sliderData == null ? [] : List<dynamic>.from(sliderData!.map((x) => x.toJson())),
  };
}

class Meta {
  int? page;
  int? limit;
  int? total;
  int? totalPage;

  Meta({
    this.page,
    this.limit,
    this.total,
    this.totalPage,
  });

  factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
    page: json["page"],
    limit: json["limit"],
    total: json["total"],
    totalPage: json["totalPage"],
  );

  Map<String, dynamic> toJson() => {
    "page": page,
    "limit": limit,
    "total": total,
    "totalPage": totalPage,
  };
}

class SliderDatum {
  String? id;
  String? order;
  String? url;
  String? image;
  bool? isPrivate;
  bool? isActive;
  DateTime? createdAt;
  DateTime? updatedAt;

  SliderDatum({
    this.id,
    this.order,
    this.url,
    this.image,
    this.isPrivate,
    this.isActive,
    this.createdAt,
    this.updatedAt,
  });

  factory SliderDatum.fromRawJson(String str) => SliderDatum.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory SliderDatum.fromJson(Map<String, dynamic> json) => SliderDatum(
    id: json["_id"],
    order: json["order"],
    url: json["url"],
    image: json["image"],
    isPrivate: json["isPrivate"],
    isActive: json["isActive"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "order": order,
    "url": url,
    "image": image,
    "isPrivate": isPrivate,
    "isActive": isActive,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
  };
}
