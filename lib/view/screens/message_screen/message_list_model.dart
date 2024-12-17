class MessageListModel {
  final List<MessageModel>? messages;

  MessageListModel({
    this.messages,
  });

  factory MessageListModel.fromJson(Map<String, dynamic> json) => MessageListModel(
    messages: json["messages"] == null ? [] : List<MessageModel>.from(json["messages"]!.map((x) => MessageModel.fromJson(x))),
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
  final String? messageId;

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
    this.messageId,
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
    messageId: json["id"],
  );
}
