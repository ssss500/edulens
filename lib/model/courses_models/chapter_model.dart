// To parse this JSON data, do
//
//     final chapterModel = chapterModelFromJson(jsonString);



class ChapterModel {
  ChapterModel({
    required this.id,
    required this.name,
    required this.cost,
    required this.courseId,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.lectures,
  });

  int id;
  String name;
  int cost;
  int courseId;
  int status;
  DateTime createdAt;
  DateTime updatedAt;
  List<Lecture> lectures;

  ChapterModel copyWith({
    int? id,
    String? name,
    int? cost,
    int? courseId,
    int? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<Lecture>? lectures,
  }) =>
      ChapterModel(
        id: id ?? this.id,
        name: name ?? this.name,
        cost: cost ?? this.cost,
        courseId: courseId ?? this.courseId,
        status: status ?? this.status,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        lectures: lectures ?? this.lectures,
      );

  factory ChapterModel.fromJson(Map<String, dynamic> json) => ChapterModel(
    id: json["id"],
    name: json["name"],
    cost: json["cost"],
    courseId: json["course_id"],
    status: json["status"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    lectures: List<Lecture>.from(json["lectures"].map((x) => Lecture.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "cost": cost,
    "course_id": courseId,
    "status": status,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "lectures": List<dynamic>.from(lectures.map((x) => x.toJson())),
  };
}

class Lecture {
  Lecture({
    required this.id,
    required this.name,
    required this.desc,
    required this.note,
    this.video,
    this.dailymotion,
    this.link,
    this.vLink,
    required this.image,
    required this.cost,
    this.start,
    this.end,
    required this.status,
    required this.chapterId,
    required this.teacherId,
    required this.studentClassId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String desc;
  String note;
  String? video;
  String? dailymotion;
  dynamic link;
  String? vLink;
  String image;
  int cost;
  String? start;
  String? end;
  int status;
  int chapterId;
  int teacherId;
  int studentClassId;
  DateTime createdAt;
  DateTime updatedAt;

  Lecture copyWith({
    int? id,
    String? name,
    String? desc,
    String? note,
    String? dailymotion,
    String? video,
    dynamic link,
    String? vLink,
    String? image,
    int? cost,
    String? start,
    String? end,
    int? status,
    int? chapterId,
    int? teacherId,
    int? studentClassId,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      Lecture(
        id: id ?? this.id,
        name: name ?? this.name,
        desc: desc ?? this.desc,
        note: note ?? this.note,
        video: video ?? this.video,
        link: link ?? this.link,
        dailymotion: dailymotion ?? this.dailymotion,
        vLink: vLink ?? this.vLink,
        image: image ?? this.image,
        cost: cost ?? this.cost,
        start: start ?? this.start,
        end: end ?? this.end,
        status: status ?? this.status,
        chapterId: chapterId ?? this.chapterId,
        teacherId: teacherId ?? this.teacherId,
        studentClassId: studentClassId ?? this.studentClassId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory Lecture.fromJson(Map<String, dynamic> json) => Lecture(
    id: json["id"],
    name: json["name"],
    desc: json["desc"],
    note: json["note"],
    video: json["video"],
    link: json["link"],
    dailymotion: json["dailymotion"],
    vLink: json["v_link"],
    image: json["image"],
    cost: json["cost"],
    start: json["start"],
    end: json["end"],
    status: json["status"],
    chapterId: json["chapter_id"],
    teacherId: json["teacher_id"],
    studentClassId: json["student_class_id"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "desc": desc,
    "note": note,
    "video": video,
    "dailymotion": dailymotion,
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
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
