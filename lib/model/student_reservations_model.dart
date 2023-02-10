
class StudentReservationsModel {
  StudentReservationsModel({
    required this.id,
    required this.name,
    this.desc,
    required this.cost,
    required this.year,
    this.start,
    this.end,
    required this.teacherId,
    required this.subjectId,
    required this.studentClassId,
    required this.createdAt,
    required this.updatedAt,
    required this.pivot,
  });

  int id;
  String name;
  dynamic desc;
  int cost;
  String year;
  dynamic start;
  dynamic end;
  int teacherId;
  int subjectId;
  int studentClassId;
  DateTime createdAt;
  DateTime updatedAt;
  Pivot pivot;

  StudentReservationsModel copyWith({
    int? id,
    String? name,
    dynamic desc,
    int? cost,
    String? year,
    dynamic start,
    dynamic end,
    int? teacherId,
    int? subjectId,
    int? studentClassId,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      StudentReservationsModel(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        cost: cost ?? this.cost,
        year: year ?? this.year,
        start: start ?? this.start,
        end: end ?? this.end,
        teacherId: teacherId ?? this.teacherId,
        subjectId: subjectId ?? this.subjectId,
        studentClassId: studentClassId ?? this.studentClassId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory StudentReservationsModel.fromJson(Map<String, dynamic> json) => StudentReservationsModel(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    cost: json["cost"],
    year: json["year"],
    start: json["start"],
    end: json["end"],
    teacherId: json["teacher_id"],
    subjectId: json["subject_id"],
    studentClassId: json["student_class_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "cost": cost,
    "year": year,
    "start": start,
    "end": end,
    "teacher_id": teacherId,
    "subject_id": subjectId,
    "student_class_id": studentClassId,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "pivot": pivot.toJson(),
  };
}

class Pivot {
  Pivot({
    required this.studentId,
    required this.reservationId,
  });

  int studentId;
  int reservationId;

  Pivot copyWith({
    int? studentId,
    int? reservationId,
  }) =>
      Pivot(
        studentId: studentId ?? this.studentId,
        reservationId: reservationId ?? this.reservationId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    studentId: json["student_id"],
    reservationId: json["reservation_id"],
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "reservation_id": reservationId,
  };
}
