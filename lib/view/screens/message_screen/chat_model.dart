import 'dart:convert';

class ChatModel {
  int? statusCode;
  bool? success;
  String? message;
  List<ChatList>? chatList;

  ChatModel({
    this.statusCode,
    this.success,
    this.message,
    this.chatList,
  });

  factory ChatModel.fromRawJson(String str) => ChatModel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatModel.fromJson(Map<String, dynamic> json) => ChatModel(
    statusCode: json["statusCode"],
    success: json["success"],
    message: json["message"],
    chatList: json["chatList"] == null ? [] : List<ChatList>.from(json["chatList"]!.map((x) => ChatList.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statusCode": statusCode,
    "success": success,
    "message": message,
    "chatList": chatList == null ? [] : List<dynamic>.from(chatList!.map((x) => x.toJson())),
  };
}

class ChatList {
  String? id;
  List<Participant?>? participants;
  List<Message>? messages;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  ChatList({
    this.id,
    this.participants,
    this.messages,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  factory ChatList.fromRawJson(String str) => ChatList.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory ChatList.fromJson(Map<String, dynamic> json) => ChatList(
    id: json["_id"],
    participants: json["participants"] == null ? [] : List<Participant?>.from(json["participants"]!.map((x) => x == null ? null : Participant.fromJson(x))),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x?.toJson())),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

class Message {
  String? id;
  String? senderId;
  String? receiverId;
  String? conversationId;
  String? message;
  String? messageImg;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? messageId;

  Message({
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

  factory Message.fromRawJson(String str) => Message.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Message.fromJson(Map<String, dynamic> json) => Message(
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

  Map<String, dynamic> toJson() => {
    "_id": id,
    "senderId": senderId,
    "receiverId": receiverId,
    "conversationId": conversationId,
    "message": message,
    "message_img": messageImg,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": messageId,
  };
}

class Participant {
  String? id;
  String? name;
  String? email;
  String? role;
  String? profileImage;
  String? type;

  Participant({
    this.id,
    this.name,
    this.email,
    this.role,
    this.profileImage,
    this.type,
  });

  factory Participant.fromRawJson(String str) => Participant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Participant.fromJson(Map<String, dynamic> json) => Participant(
    id: json["_id"],
    name: json["name"],
    email: json["email"],
    role: json["role"],
    profileImage: json["profile_image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
    "email": email,
    "role": role,
    "profile_image": profileImage,
    "type": type,
  };
}
