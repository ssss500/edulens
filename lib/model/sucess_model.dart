class SucessModel {
  SucessModel({
    this.success,
  });

  SucessModel.fromJson(dynamic json) {
    success = json['success'];
  }

  String? success;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    return map;
  }
}
