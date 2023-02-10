// To parse this JSON data, do
//
//     final chapterPaidModel = chapterPaidModelFromJson(jsonString);



class ChapterPaidModel {
  ChapterPaidModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.courseId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  int cost;
  int courseId;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  ChapterPaidModel copyWith({
    int? id,
    String? name,
    int? cost,
    int? courseId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      ChapterPaidModel(
        id: id ?? this.id,
        name: name ?? this.name,
        cost: cost ?? this.cost,
        courseId: courseId ?? this.courseId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory ChapterPaidModel.fromJson(Map<String, dynamic> json) => ChapterPaidModel(
    id: json["id"],
    name: json["name"],
    cost: json["cost"],
    courseId: json["course_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cost": cost,
    "course_id": courseId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.studentId,
    required this.chapterId,
  });

  int studentId;
  int chapterId;

  Pivot copyWith({
    int? studentId,
    int? chapterId,
  }) =>
      Pivot(
        studentId: studentId ?? this.studentId,
        chapterId: chapterId ?? this.chapterId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    studentId: json["student_id"],
    chapterId: json["chapter_id"],
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "chapter_id": chapterId,
  };
}
