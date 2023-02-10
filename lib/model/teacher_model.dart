/// id : 2
/// name_title : "هير"
/// first_name : "خالد"
/// last_name : "الفقي"
/// email : "KhaledElfeky@edu-lens.com"
/// phone : "01001433973"
/// password : "$2y$10$3/NEJrlvt1IbcBDM2Dd/F.rNIJ6USWa2law3GaFMK2iUHCigLHrie"
/// image : "خالد-15خالد-الفقي.png"
/// face_link : "https://www.facebook.com/HerrkhaledElfeky/"
/// youtube_link : "https://youtube.com/channel/UCHCKc8UfFp1i8Y5Ko_g1hoA"
/// insta_link : "https://instagram.com/edulens.egy?igshid=YmMyMTA2M2Y="
/// description : "معلم خبير لغة ألمانية"
/// dispaly : 0
/// status : 1
/// meta_title : "خالد الفقي"
/// meta_desc : "اللغة الألمانية"
/// keywords : "هير خالد الفقي ، هير ، خالد الفقي ، الماني ، لغه تانيه ، المانيه"
/// created_by : "ادهم عادل"
/// created_at : "2022-04-15T04:26:40.000000Z"
/// updated_at : "2022-08-28T15:54:23.000000Z"

class TeacherModel {
  TeacherModel({
    num? id,
    String? nameTitle,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? image,
    String? faceLink,
    String? youtubeLink,
    String? instaLink,
    String? description,
    num? dispaly,
    num? status,
    String? metaTitle,
    String? metaDesc,
    String? keywords,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
  }) {
    _id = id;
    _nameTitle = nameTitle;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _password = password;
    _image = image;
    _faceLink = faceLink;
    _youtubeLink = youtubeLink;
    _instaLink = instaLink;
    _description = description;
    _dispaly = dispaly;
    _status = status;
    _metaTitle = metaTitle;
    _metaDesc = metaDesc;
    _keywords = keywords;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
  }

  TeacherModel.fromJson(Map<dynamic, dynamic> json) {
    _id = json['id'];
    _nameTitle = json['name_title'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _image = json['image'];
    _faceLink = json['face_link'];
    _youtubeLink = json['youtube_link'];
    _instaLink = json['insta_link'];
    _description = json['description'];
    _dispaly = json['dispaly'];
    _status = json['status'];
    _metaTitle = json['meta_title'];
    _metaDesc = json['meta_desc'];
    _keywords = json['keywords'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }

  num? _id;
  String? _nameTitle;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _password;
  String? _image;
  String? _faceLink;
  String? _youtubeLink;
  String? _instaLink;
  String? _description;
  num? _dispaly;
  num? _status;
  String? _metaTitle;
  String? _metaDesc;
  String? _keywords;
  String? _createdBy;
  String? _createdAt;
  String? _updatedAt;

  TeacherModel copyWith({
    num? id,
    String? nameTitle,
    String? firstName,
    String? lastName,
    String? email,
    String? phone,
    String? password,
    String? image,
    String? faceLink,
    String? youtubeLink,
    String? instaLink,
    String? description,
    num? dispaly,
    num? status,
    String? metaTitle,
    String? metaDesc,
    String? keywords,
    String? createdBy,
    String? createdAt,
    String? updatedAt,
  }) =>
      TeacherModel(
        id: id ?? _id,
        nameTitle: nameTitle ?? _nameTitle,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        phone: phone ?? _phone,
        password: password ?? _password,
        image: image ?? _image,
        faceLink: faceLink ?? _faceLink,
        youtubeLink: youtubeLink ?? _youtubeLink,
        instaLink: instaLink ?? _instaLink,
        description: description ?? _description,
        dispaly: dispaly ?? _dispaly,
        status: status ?? _status,
        metaTitle: metaTitle ?? _metaTitle,
        metaDesc: metaDesc ?? _metaDesc,
        keywords: keywords ?? _keywords,
        createdBy: createdBy ?? _createdBy,
        createdAt: createdAt ?? _createdAt,
        updatedAt: updatedAt ?? _updatedAt,
      );

  num? get id => _id;

  String? get nameTitle => _nameTitle;

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;

  String? get phone => _phone;

  String? get password => _password;

  String? get image => _image;

  String? get faceLink => _faceLink;

  String? get youtubeLink => _youtubeLink;

  String? get instaLink => _instaLink;

  String? get description => _description;

  num? get dispaly => _dispaly;

  num? get status => _status;

  String? get metaTitle => _metaTitle;

  String? get metaDesc => _metaDesc;

  String? get keywords => _keywords;

  String? get createdBy => _createdBy;

  String? get createdAt => _createdAt;

  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name_title'] = _nameTitle;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    map['image'] = _image;
    map['face_link'] = _faceLink;
    map['youtube_link'] = _youtubeLink;
    map['insta_link'] = _instaLink;
    map['description'] = _description;
    map['dispaly'] = _dispaly;
    map['status'] = _status;
    map['meta_title'] = _metaTitle;
    map['meta_desc'] = _metaDesc;
    map['keywords'] = _keywords;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }
}
