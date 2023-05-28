// // {
// // "id": 251,
// // "name": "المحاضرة الاولي",
// // "desc": "المحاضرة الاولي",
// // "note": "المحاضرة الاولي",
// // "video": null,
// // "link": null,
// // "v_link": "744787508?h=1492f37ce0",
// // "image": "المحاضرة الاولي-14فراو سعاد.jpg",
// // "start": "2022-08-31T14:16",
// // "end": "2023-08-31T14:16",
// // "status": 1,
// // "chapter_id": 70,
// // "teacher_id": 44,
// // "student_class_id": 14,
// // "cost": 0,
// // "created_at": "2022-08-31T12:20:14.000000Z",
// // "updated_at": "2022-08-31T12:20:14.000000Z"
// // },
// class LectureModel {
//   LectureModel({
//     num? id,
//     String? name,
//     String? desc,
//     String? note,
//     String? video,
//     String? link,
//     String? vLink,
//     String? image,
//     String? start,
//     String? end,
//     int? status,
//     int? chapterId,
//     int? teacherId,
//     int? studentClassId,
//     int? cost,
//     int? courseId,
//     String? createdAt,
//     String? updatedAt,
//   }) {
//     _id = id;
//     _name = name;
//     _desc = desc;
//     _note = note;
//     _video = video;
//     _link = link;
//     _vLink = vLink;
//     _image = image;
//     _start = start;
//     _end = end;
//     _status = status;
//     _chapterId = chapterId;
//     _teacherId = teacherId;
//     _studentClassId = studentClassId;
//     _cost = cost;
//     _courseId = courseId;
//     _createdAt = createdAt;
//     _updatedAt = updatedAt;
//   }
//
//   LectureModel.fromJson(Map<dynamic, dynamic> json) {
//     _id = json['id'];
//     _name = json['name'];
//     _cost = json['cost'];
//     _desc = json['desc'];
//     _note = json['note'];
//     _video = json['video'];
//     _link = json['link'];
//     _vLink = json['v_link'];
//     _image = json['image'];
//     _start = json['start'];
//     _end = json['end'];
//     _status = json['status'];
//     _chapterId = json['chapter_id'];
//     _teacherId = json['teacher_id'];
//     _studentClassId = json['student_class_id'];
//     _courseId = json['course_id'];
//     _createdAt = json['created_at'];
//     _updatedAt = json['updated_at'];
//   }
//
//   num? _id;
//   String? _name;
//   int? _cost;
//   String? _desc;
//   String? _note;
//   String? _video;
//   String? _link;
//   String? _vLink;
//   String? _image;
//   String? _start;
//   String? _end;
//   int? _status;
//   int? _chapterId;
//   int? _teacherId;
//   int? _studentClassId;
//   int? _courseId;
//   String? _createdAt;
//   String? _updatedAt;
//
//   //
//   LectureModel copyWith({
//     num? id,
//     String? name,
//     String? desc,
//     String? note,
//     String? video,
//     String? link,
//     String? vLink,
//     String? image,
//     String? start,
//     String? end,
//     int? status,
//     int? chapterId,
//     int? teacherId,
//     int? studentClassId,
//     int? cost,
//     int? courseId,
//     String? createdAt,
//     String? updatedAt,
//   }) =>
//       LectureModel(
//         id: id ?? _id,
//         name: name ?? _name,
//         desc: desc ?? _desc,
//         note: note ?? _note,
//         video: video ?? _video,
//         link: link ?? _link,
//         vLink: vLink ?? _vLink,
//         image: image ?? _image,
//         start: start ?? _start,
//         end: end ?? _end,
//         status: status ?? _status,
//         chapterId: chapterId ?? _chapterId,
//         teacherId: teacherId ?? _teacherId,
//         studentClassId: studentClassId ?? _studentClassId,
//         cost: cost ?? _cost,
//         courseId: courseId ?? _courseId,
//         createdAt: createdAt ?? _createdAt,
//         updatedAt: updatedAt ?? _updatedAt,
//       );
//
//   num? get id => _id;
//
//   String? get name => _name;
//
//   int? get courseId => _courseId;
//
//   String? get desc => _desc;
//
//   String? get note => _note;
//
//   String? get video => _video;
//
//   String? get link => _link;
//
//   String? get vLink => _vLink;
//
//   String? get image => _image;
//
//   String? get start => _start;
//
//   String? get end => _end;
//
//   int? get status => _status;
//
//   int? get chapterId => _chapterId;
//
//   int? get teacherId => _teacherId;
//
//   int? get studentClassId => _studentClassId;
//
//   int? get cost => _cost;
//
//   String? get createdAt => _createdAt;
//
//   String? get updatedAt => _updatedAt;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['id'] = _id;
//     map['name'] = _name;
//     map['course_id'] = _courseId;
//     map['desc'] = _desc;
//     map['note'] = _note;
//     map['video'] = _video;
//     map['link'] = _link;
//     map['v_link'] = _vLink;
//     map['image'] = _image;
//     map['start'] = _start;
//     map['end'] = _end;
//     map['status'] = _status;
//     map['chapter_id'] = _chapterId;
//     map['teacher_id'] = _teacherId;
//     map['student_class_id'] = _studentClassId;
//     map['cost'] = _cost;
//     map['created_at'] = _createdAt;
//     map['updated_at'] = _updatedAt;
//     return map;
//   }
// }
