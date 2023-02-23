// To parse this JSON data, do
//
//     final lecturePaidModel = lecturePaidModelFromJson(jsonString);

import 'dart:convert';

// LecturePaidModel lecturePaidModelFromJson(String str) => LecturePaidModel.fromJson(json.decode(str));

// String lecturePaidModelToJson(LecturePaidModel data) => json.encode(data.toJson());

class LecturePaidModel {
  LecturePaidModel({
    this.id,
    this.name,
    this.desc,
    this.note,
    this.video,
    this.link,
    this.vLink,
    this.image,
    this.cost,
    this.start,
    this.end,
    this.status,
    this.chapterId,
    this.teacherId,
    this.studentClassId,
    // this.createdAt,
    // this.updatedAt,
    this.pivot,
  });

  int? id;
  String? name;
  String? desc;
  String? note;
  String? video;
  String? link;
  String? vLink;
  String? image;
  int? cost;
  String? start;
  String? end;
  int? status;
  int? chapterId;
  int? teacherId;
  int? studentClassId;
  // DateTime? createdAt;
  // DateTime? updatedAt;
  Pivot? pivot;

  LecturePaidModel copyWith({
    int? id,
    String? name,
    String? desc,
    String? note,
    String? video,
    String? link,
    String? vLink,
    String? image,
    int? cost,
    String? start,
    String? end,
    int? status,
    int? chapterId,
    int? teacherId,
    int? studentClassId,
    // DateTime? createdAt,
    // DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      LecturePaidModel(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        note: note ?? this.note,
        video: video ?? this.video,
        link: link??this.link,
        vLink: vLink??this.vLink,
        image: image ?? this.image,
        cost: cost ?? this.cost,
        start: start ?? this.start,
        end: end ?? this.end,
        status: status ?? this.status,
        chapterId: chapterId ?? this.chapterId,
        teacherId: teacherId ?? this.teacherId,
        studentClassId: studentClassId ?? this.studentClassId,
        // createdAt: createdAt ?? this.createdAt,
        // updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory LecturePaidModel.fromJson(Map<String, dynamic> json) => LecturePaidModel(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    note: json["note"],
    video: json["video"],
    link: json["link"],
    vLink: json["v_link"],
    image: json["image"],
    cost: json["cost"],
    start: json["start"],
    end: json["end"],
    status: json["status"],
    chapterId: json["chapter_id"],
    teacherId: json["teacher_id"],
    studentClassId: json["student_class_id"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
    pivot: Pivot.fromJson(json["pivot"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "note": note,
    "video": video,
    "link": link,
    "v_link": vLink,
    "image": image,
    "cost": cost,
    "start": start,
    "end": end,
    "status": status,
    "chapter_id": chapterId,
    "teacher_id": teacherId,
    "student_class_id": studentClassId,
    // "created_at": createdAt!.toIso8601String(),
    // "updated_at": updatedAt!.toIso8601String(),
    "pivot": pivot!.toJson(),
  };
}

class Pivot {
  Pivot({
    this.studentId,
    this.lectureId,
    // this.createdAt,
    // this.updatedAt,
  });

  int? studentId;
  int? lectureId;
  // DateTime? createdAt;
  // DateTime? updatedAt;

  Pivot copyWith({
    int? studentId,
    int? lectureId,
    DateTime? createdAt,
    dynamic updatedAt,
  }) =>
      Pivot(
        studentId: studentId ?? this.studentId,
        lectureId: lectureId ?? this.lectureId,
        // createdAt: createdAt ?? this.createdAt,
        // updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
    studentId: json["student_id"],
    lectureId: json["lecture_id"],
    // createdAt: DateTime.parse(json["created_at"]),
    // updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "student_id": studentId,
    "lecture_id": lectureId,
    // "created_at": createdAt ,
    // "updated_at": updatedAt,
  };
}
