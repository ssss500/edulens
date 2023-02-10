// class ClassesModel {
//   int? id;
//   String? name;
//   int? gradeId;
//   String? createdAt;
//   String? updatedAt;
//   ClassesModel({
//     this.id,
//     this.name,
//     this.gradeId,
//     this.createdAt,
//     this.updatedAt,
//   }){
//
//   };
//
//   ClassesModel.fromJson(dynamic json) {
//     id = json['id'];
//     name = json['name'];
//     gradeId = json['grade_id'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//   }
//
//
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = id;
//     map['name'] = name;
//     map['grade_id'] = gradeId;
//     map['created_at'] = createdAt;
//     map['updated_at'] = updatedAt;
//     return map;
//   }
// }
class ClassesModel {
  ClassesModel({
    int? id,
    String? name,
    int? gradeId,
    String? createdAt,
    String? updatedAt,

  }) {
    _id = id;
    _name = name;
    _gradeId = gradeId;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  ClassesModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _name = json['name'];
    _gradeId = json['grade_id'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  int? _id;
  String? _name;
  int? _gradeId;
  String? _createdAt;
  String? _updatedAt;


  ClassesModel copyWith({
    int? id,
    String? name,
    int? gradeId,
    String? createdAt,
    String? updatedAt,

  }) =>
      ClassesModel(
        id: id ?? _id,
        name: name ?? _name,
        gradeId: gradeId ?? _gradeId,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,

      );

  num? get id => _id;

  String? get name => _name;

  int? get gradeId => _gradeId;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    map['grade_id'] = _gradeId;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;

    return map;
  }
}
