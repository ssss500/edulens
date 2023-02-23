/// "id": 101,
/// "name": "اللغة الالمانية | الصف الاول الثانوي | هير خالد الفقي",
/// "student_class_id": 12,
/// "subject_id": 2,
/// "image": "اللغة الالمانية | الصف الاول الثانوي | هير خالد الفقي-46خالد-15خالد-الفقي.png",
/// "cost": 200,
/// "profit": null,
/// "note": null,
/// "created_by": "يوسف أيمن",
/// "created_at": "2022-10-03T21:31:46.000000Z",
/// "updated_at": "2022-10-03T21:31:46.000000Z",
/// "pivot": {
/// "teacher_id": 2,
/// "course_id": 101
/// }

class CoursesModel {
  CoursesModel({
    num? id,
    String? name,
    int? studentClassId,
    int? subjectId,
    String? image,
    int? cost,
    String? profit,
    String? note,
    String? createdBy,
    // String? createdAt,
    // String? updatedAt,
    Map? pivot,


  }) {
    _id = id;
    _name = name;
    _studentClassId = studentClassId;
    _subjectId = subjectId;
    _image = image;
    _cost = cost;
    _profit = profit;
    _note = note;
    _createdBy = createdBy;
    // _createdAt = createdAt;
    // _updatedAt = updatedAt;
    _pivot = pivot;
  }

  CoursesModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _studentClassId = json['student_class_id'];
    _subjectId = json['subject_id'];
    _image = json['image'];
    _cost = json['cost'];
    _profit = json['profit'];
    _note = json['note'];
    _pivot = json['pivot'];
    _createdBy = json['created_by'];
    // _createdAt = json['created_at'];
    // _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _name;
  int? _studentClassId;
  int? _subjectId;
  String? _image;
  int? _cost;
  String? _profit;
  String? _note;
  String? _createdBy;
  // String? _createdAt;
  // String? _updatedAt;
  Map? _pivot;

  CoursesModel copyWith({
    num? id,
    String? name,
    int? studentClassId,
    int? subjectId,
    String? image,
    int? cost,
    String? profit,
    String? note,
    String? createdBy,
    // String? createdAt,
    // String? updatedAt,
    Map? pivot,
  }) =>
      CoursesModel(
        id: id ?? _id,
        name: name ?? _name,
        studentClassId: studentClassId ?? _studentClassId,
        subjectId: subjectId ?? _subjectId,
        image: image ?? _image,
        cost: cost ?? _cost,
        profit: profit ?? _profit,
        note: note ?? _note,
        pivot: pivot ?? _pivot,
        createdBy: createdBy ?? _createdBy,
        // createdAt: createdAt ?? _createdAt,
        // updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get name => _name;

  int? get  studentClassId=> _studentClassId;

  int? get subjectId => _subjectId;

  String? get image => _image;

  int? get cost => _cost;

  String? get profit => _profit;

  String? get note => _note;

  String? get createdBy => _createdBy;

  // String? get createdAt => _createdAt;
  //
  // String? get updatedAt => _updatedAt;

  Map? get pivot => _pivot;



  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['student_class_id'] = _studentClassId;
    map['subject_id'] = _subjectId;
    map['image'] = _image;
    map['cost'] = _cost;
    map['profit'] = _profit;
    map['note'] = _note;
    map['pivot'] = _pivot;
    map['created_by'] = _createdBy;
    // map['created_at'] = _createdAt;
    // map['updated_at'] = _updatedAt;
    return map;
  }
}
