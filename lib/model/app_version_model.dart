
class AppVersionModel {
  AppVersionModel({
    this.id,
    this.androidVersion,
    this.iosVersion,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? androidVersion;
  String? iosVersion;
  DateTime? createdAt;
  DateTime? updatedAt;

  AppVersionModel copyWith({
    int? id,
    String? androidVersion,
    String? iosVersion,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) =>
      AppVersionModel(
        id: id ?? this.id,
        androidVersion: androidVersion ?? this.androidVersion,
        iosVersion: iosVersion ?? this.iosVersion,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );

  factory AppVersionModel.fromJson(Map<String, dynamic> json) => AppVersionModel(
        id: json["id"],
        androidVersion: json["android_version"],
        iosVersion: json["ios_version"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "android_version": androidVersion,
        "ios_version": iosVersion,
        "created_at": createdAt?.toIso8601String(),
        "updated_at": updatedAt?.toIso8601String(),
      };
}
