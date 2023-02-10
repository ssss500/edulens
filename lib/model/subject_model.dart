class SubjectModel {
  SubjectModel({
    this.id,
    this.name,
    this.image,
    this.note,
    this.createdBy,
    this.createdAt,
    this.updatedAt,
  });

  SubjectModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    note = json['note'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  int? id;
  String? name;
  String? image;
  dynamic note;
  String? createdBy;
  String? createdAt;
  String? updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['image'] = image;
    map['note'] = note;
    map['created_by'] = createdBy;
    map['created_at'] = createdAt;
    map['updated_at'] = updatedAt;
    return map;
  }
}
