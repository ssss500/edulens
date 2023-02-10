// To parse this JSON data, do
//
//     final planModel = planModelFromJson(jsonString);


class PlanModel {
  PlanModel({
    required this.id,
    required this.name,
    required this.price,
    required this.chapterNumber,
    required this.studentClassId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  int price;
  int chapterNumber;
  int studentClassId;
  DateTime createdAt;
  DateTime updatedAt;

  PlanModel copyWith({
    int? id,
    String? name,
    int? price,
    int? chapterNumber,
    int? studentClassId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PlanModel(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        chapterNumber: chapterNumber ?? this.chapterNumber,
        studentClassId: studentClassId ?? this.studentClassId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PlanModel.fromJson(Map<String, dynamic> json) => PlanModel(
    id: json["id"],
    name: json["name"],
    price: json["price"],
    chapterNumber: json["chapter_number"],
    studentClassId: json["student_class_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "price": price,
    "chapter_number": chapterNumber,
    "student_class_id": studentClassId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
