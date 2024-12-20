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
  Id? id;
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
    id: idValues.map[json["_id"]]!,
    participants: json["participants"] == null ? [] : List<Participant?>.from(json["participants"]!.map((x) => x == null ? null : Participant.fromJson(x))),
    messages: json["messages"] == null ? [] : List<Message>.from(json["messages"]!.map((x) => Message.fromJson(x))),
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": idValues.reverse[id],
    "participants": participants == null ? [] : List<dynamic>.from(participants!.map((x) => x?.toJson())),
    "messages": messages == null ? [] : List<dynamic>.from(messages!.map((x) => x.toJson())),
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}

enum Id {
  THE_67614591_FE38_D1746_EF09_A22,
  THE_67656365_B29_E0351627_A7783
}

final idValues = EnumValues({
  "67614591fe38d1746ef09a22": Id.THE_67614591_FE38_D1746_EF09_A22,
  "67656365b29e0351627a7783": Id.THE_67656365_B29_E0351627_A7783
});

class Message {
  String? id;
  ReceiverId? senderId;
  ReceiverId? receiverId;
  Id? conversationId;
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
    senderId: receiverIdValues.map[json["senderId"]]!,
    receiverId: receiverIdValues.map[json["receiverId"]]!,
    conversationId: idValues.map[json["conversationId"]]!,
    message: json["message"],
    messageImg: json["message_img"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"],
    messageId: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "senderId": receiverIdValues.reverse[senderId],
    "receiverId": receiverIdValues.reverse[receiverId],
    "conversationId": idValues.reverse[conversationId],
    "message": message,
    "message_img": messageImg,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
    "id": messageId,
  };
}

enum ReceiverId {
  THE_672718_A40_FB17_B271_D8_E5564,
  THE_672_AFFDC8_E5_C6_C398_B0_A97_A4,
  THE_67611_EDCFE38_D1746_EF04_C52
}

final receiverIdValues = EnumValues({
  "672718a40fb17b271d8e5564": ReceiverId.THE_672718_A40_FB17_B271_D8_E5564,
  "672affdc8e5c6c398b0a97a4": ReceiverId.THE_672_AFFDC8_E5_C6_C398_B0_A97_A4,
  "67611edcfe38d1746ef04c52": ReceiverId.THE_67611_EDCFE38_D1746_EF04_C52
});

class Participant {
  ReceiverId? id;
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
    id: receiverIdValues.map[json["_id"]]!,
    name: json["name"],
    email: json["email"],
    role: json["role"],
    profileImage: json["profile_image"],
    type: json["type"],
  );

  Map<String, dynamic> toJson() => {
    "_id": receiverIdValues.reverse[id],
    "name": name,
    "email": email,
    "role": role,
    "profile_image": profileImage,
    "type": type,
  };
}

class EnumValues<T> {
  Map<String, T> map;
  late Map<T, String> reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    reverseMap = map.map((k, v) => MapEntry(v, k));
    return reverseMap;
  }
}
