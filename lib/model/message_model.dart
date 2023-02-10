// To parse this JSON data, do
//
//     final messageModel = messageModelFromJson(jsonString);


class MessageModel {
  MessageModel({
    this.id,
    this.title,
    this.body,
    this.image,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? title;
  String? body;
  String? image;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  MessageModel copyWith({
    int? id,
    String? title,
    String? body,
    String? image,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      MessageModel(
        id: id ?? this.id,
        title: title ?? this.title,
        body: body ?? this.body,
        image: image ?? this.image,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    image: json["image"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "body": body,
    "image": image,
    "created_at": createdAt?.toIso8601String(),
    "updated_at": updatedAt?.toIso8601String(),
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.studentClassId,
    this.messageId,
  });

  int? studentClassId;
  int? messageId;

  Pivot copyWith({
    int? studentClassId,
    int? messageId,
  }) =>
      Pivot(
        studentClassId: studentClassId ?? this.studentClassId,
        messageId: messageId ?? this.messageId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    studentClassId: json["student_class_id"],
    messageId: json["message_id"],
  );

  Map<String, dynamic> toJson() => {
    "student_class_id": studentClassId,
    "message_id": messageId,
  };
}
