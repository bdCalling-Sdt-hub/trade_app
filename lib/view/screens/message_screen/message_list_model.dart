class MessageListModel {
  final int? statusCode;
  final bool? success;
  final List<MessageModel>? data;

  MessageListModel({
    this.statusCode,
    this.success,
    this.data,
  });

  factory MessageListModel.fromJson(Map<String, dynamic> json) => MessageListModel(
    statusCode: json["statusCode"],
    success: json["success"],
    data: json["data"] == null ? [] : List<MessageModel>.from(json["data"]!.map((x) => MessageModel.fromJson(x))),
  );
}

class MessageModel {
  final String? id;
  final String? senderId;
  final String? receiverId;
  final String? conversationId;
  final String? message;
  final String? messageImg;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final int? v;
  final String? datumId;

  MessageModel({
    this.id,
    this.senderId,
    this.receiverId,
    this.conversationId,
    this.message,
    this.messageImg,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.datumId,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["_id"],
    senderId: json["senderId"],
    receiverId: json["receiverId"],
    conversationId: json["conversationId"],
    message: json["message"],
    messageImg: json["message_img"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    datumId: json["id"],
  );
}
