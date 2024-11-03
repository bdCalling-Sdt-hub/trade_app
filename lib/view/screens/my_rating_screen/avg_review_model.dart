import 'dart:convert';

class AvgReviewModel {
  int? statusCode;
  bool? success;
  String? message;
  Data? data;

  AvgReviewModel({
    this.statusCode,
    this.success,
    this.message,
    this.data,
  });

  factory AvgReviewModel.fromRawJson(String str) => AvgReviewModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory AvgReviewModel.fromJson(Map<String, dynamic> json) => AvgReviewModel(
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
  double? averageRating;

  Data({
    this.averageRating,
  });

  factory Data.fromRawJson(String str) => Data.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    averageRating: json["averageRating"]?.toDouble(),
  );

  Map<String, dynamic> toJson() => {
    "averageRating": averageRating,
  };
}
