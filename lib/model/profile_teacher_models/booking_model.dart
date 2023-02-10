// {
// "id": 8,
// "name": "حجز العام الدراسي 2022/2023 للاستاذ خالد الفقي للصف الثالث الثانوي",
// "desc": null,
// "cost": 20,
// "year": "2022-08",
// "start": null,
// "end": null,
// "teacher_id": 2,
// "subject_id": 2,
// "student_class_id": 14,
// "created_at": "2022-08-04T22:22:11.000000Z",
// "updated_at": "2022-08-04T22:22:11.000000Z"
// }
class BookingModel {
  BookingModel({
    num? id,
    String? name,
    String? desc,
    int? cost,
    String? year,
    String? start,
    String? end,
    int? studentClassId,
    int? teacherId,
    int? subjectId,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _name = name;
    _studentClassId = studentClassId;
    _subjectId = subjectId;
    _cost = cost;
    _desc = desc;
    _year = year;
    _start = start;
    _end = end;
    _teacherId = teacherId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  BookingModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _studentClassId = json['student_class_id'];
    _subjectId = json['subject_id'];
    _cost = json['cost'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _desc = json['desc'];
    _year = json['year'];
    _start = json['start'];
    _end = json['end'];
    _teacherId = json['teacher_id'];
  }

  num? _id;
  String? _name;
  int? _studentClassId;
  int? _subjectId;
  int? _cost;
  String? _createdAt;
  String? _updatedAt;
  String? _desc;
  String? _year;
  String? _start;
  String? _end;
  int? _teacherId;
  //
  BookingModel copyWith({
    num? id,
    String? name,
    int? studentClassId,
    int? subjectId,
    int? cost,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
    String? desc,
    String? year,
    String? start,
    String? end,
    int? teacherId,
  }) =>
      BookingModel(
        id: id ?? _id,
        name: name ?? _name,
        studentClassId: studentClassId ?? _studentClassId,
        subjectId: subjectId ?? _subjectId,
        cost: cost ?? _cost,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        desc: desc ?? _desc,
        year: year ?? _year,
        start: start ?? _start,
        end: end ?? _end,
        teacherId: teacherId ?? _teacherId,
      );

  num? get id => _id;

  String? get name => _name;

  int? get studentClassId => _studentClassId;

  int? get subjectId => _subjectId;

  int? get cost => _cost;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  String? get desc => _desc;

  String? get year => _year;

  String? get start => _start;

  String? get end => _end;

  int? get teacherId => _teacherId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['student_class_id'] = _studentClassId;
    map['subject_id'] = _subjectId;
    map['cost'] = _cost;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['desc'] = _desc;
    map['year'] = _year;
    map['start'] = _start;
    map['end'] = _end;
    map['teacher_id'] = _teacherId;
    return map;
  }
}
