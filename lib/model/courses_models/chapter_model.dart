// {
// "id": 173,
// "name": "محاسبة مالية",
// "cost": 500,
// "course_id": 114,
// "created_at": "2022-10-26T11:28:38.000000Z",
// "updated_at": "2022-10-26T11:28:38.000000Z"
// }
import 'package:edu_lens/model/courses_models/lecture_model.dart';

class ChapterModel {
  ChapterModel({
    num? id,
    String? name,
    int? cost,
    int? courseId,
    String? createdAt,
    String? updatedAt,
    List? lectures,
  }) {
    _id = id;
    _name = name;
    _cost = cost;
    _courseId = courseId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
    _lectures = lectures;
  }

  ChapterModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _cost = json['cost'];
    _courseId = json['course_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
    _lectures = json['lectures'];
  }

  num? _id;
  String? _name;
  int? _cost;
  int? _courseId;
  String? _createdAt;
  String? _updatedAt;
  List? _lectures;

  //
  ChapterModel copyWith({
    num? id,
    String? name,
    int? cost,
    int? courseId,
    String? createdAt,
    String? updatedAt,
    List? lectures,
  }) =>
      ChapterModel(
        id: id ?? _id,
        name: name ?? _name,
        cost: cost ?? _cost,
        courseId: courseId ?? _courseId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
        lectures: lectures ?? _lectures,
      );

  num? get id => _id;

  String? get name => _name;

  int? get courseId => _courseId;

  int? get cost => _cost;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  List? get lectures =>
      List<LectureModel>.from(_lectures!.map((i) => LectureModel.fromJson(i)));

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['course_id'] = _courseId;
    map['cost'] = _cost;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    map['lectures'] = _lectures;
    return map;
  }
}
