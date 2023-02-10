// To parse this JSON data, do
//
//     final CoverModel = CoverModelFromJson(jsonString);

class CoverModel {
  CoverModel({
    this.id,
    this.image,
    this.title,
    this.desc,
    this.status,
    this.createdAt,
    this.updatedAt,
    this.pivot,
  });

  int? id;
  String? image;
  String? title;
  dynamic desc;
  int? status;
  DateTime? createdAt;
  DateTime? updatedAt;
  Pivot? pivot;

  CoverModel copyWith({
    int? id,
    String? image,
    String? title,
    dynamic desc,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    Pivot? pivot,
  }) =>
      CoverModel(
        id: id ?? this.id,
        image: image ?? this.image,
        title: title ?? this.title,
        desc: desc ?? this.desc,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        pivot: pivot ?? this.pivot,
      );

  factory CoverModel.fromJson(Map<String, dynamic> json) => CoverModel(
        id: json["id"],
        image: json["image"],
        title: json["title"],
        desc: json["desc"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        pivot: Pivot.fromJson(json["pivot"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image": image,
        "title": title,
        "desc": desc,
        "status": status,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
        "pivot": pivot!.toJson(),
      };
}

class Pivot {
  Pivot({
    this.studentClassId,
    this.coverId,
  });

  int? studentClassId;
  int? coverId;

  Pivot copyWith({
    int? studentClassId,
    int? coverId,
  }) =>
      Pivot(
        studentClassId: studentClassId ?? this.studentClassId,
        coverId: coverId ?? this.coverId,
      );

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        studentClassId: json["student_class_id"],
        coverId: json["cover_id"],
      );

  Map<String, dynamic> toJson() => {
        "student_class_id": studentClassId,
        "cover_id": coverId,
      };
}
