// To parse this JSON data, do
//
//     final pdfModel = pdfModelFromJson(jsonString);

// import 'dart:convert';

// PdfModel pdfModelFromJson(String str) => PdfModel.fromJson(json.decode(str));

// String pdfModelToJson(PdfModel data) => json.encode(data.toJson());

class PdfModel {
  PdfModel({
    this.id,
    this.title,
    this.desc,
    this.isBook,
    this.canDownload,
    this.status,
    this.file,
    this.image,
    this.cost,
    this.createdBy,
    this.teacherId,
    this.lectureId,
    this.chapterId,
    this.studentClassId,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? title;
  dynamic desc;
  int? isBook;
  int? canDownload;
  int? status;
  String? file;
  dynamic image;
  int? cost;
  String? createdBy;
  int? teacherId;
  int? lectureId;
  dynamic chapterId;
  int? studentClassId;
  DateTime? createdAt;
  DateTime? updatedAt;

  PdfModel copyWith({
    int? id,
    String? title,
    dynamic desc,
    int? isBook,
    int? canDownload,
    int? status,
    String? file,
    dynamic image,
    int? cost,
    String? createdBy,
    int? teacherId,
    int? lectureId,
    dynamic chapterId,
    int? studentClassId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      PdfModel(
        id: id ?? this.id,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        isBook: isBook ?? this.isBook,
        canDownload: canDownload ?? this.canDownload,
        status: status ?? this.status,
        file: file ?? this.file,
        image: image ?? this.image,
        cost: cost ?? this.cost,
        createdBy: createdBy ?? this.createdBy,
        teacherId: teacherId ?? this.teacherId,
        lectureId: lectureId ?? this.lectureId,
        chapterId: chapterId ?? this.chapterId,
        studentClassId: studentClassId ?? this.studentClassId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory PdfModel.fromJson(Map<String, dynamic> json) => PdfModel(
    id: json["id"],
    title: json["title"],
    desc: json["desc"],
    isBook: json["is_book"],
    canDownload: json["can_download"],
    status: json["status"],
    file: json["file"],
    image: json["image"],
    cost: json["cost"],
    createdBy: json["created_by"],
    teacherId: json["teacher_id"],
    lectureId: json["lecture_id"],
    chapterId: json["chapter_id"],
    studentClassId: json["student_class_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "desc": desc,
    "is_book": isBook,
    "can_download": canDownload,
    "status": status,
    "file": file,
    "image": image,
    "cost": cost,
    "created_by": createdBy,
    "teacher_id": teacherId,
    "lecture_id": lectureId,
    "chapter_id": chapterId,
    "student_class_id": studentClassId,
    "created_at": createdAt,
    "updated_at": updatedAt,
  };
}
