/// student : {"id":707,
/// "first_name":"أحمد",
/// "last_name":"سعيد",
/// "email":"mohamed@aa.com",
/// "phone":"01234567899",
///
/// "password":"$2y$10$QexC29iLqQS82bikhQcIGO5/dCCkAD/a7PzsCBhQ1qx9LbZyXvbn2","image":null,"university":null,"faculty":null,"department":null,"city_id":14,"grade_id":3,"student_class_id":12,"student_section_id":1,"gender_id":1,"edara":"الساحل","school":"ناصر","parent_name":"سعيد","parent_phone":"0123456789","birthday":"2008-12-16","bucket":175,"note":null,"status":1,"last_session":"StwVakplH8MxiLMI0X7bw2rkznIHi9hFqlslpwg4","created_by":null,"created_at":"2022-04-19T07:23:06.000000Z","updated_at":"2022-10-28T14:09:54.000000Z"}
/// token : "5|0yc0MmWMsZNyQJeD1s2KdYfySKTaBeV249n3KFd1"

class UserModel {
  UserModel({
    StudentModel? student,
      String? token,}){
    _student = student;
    _token = token;
}

  UserModel.fromJson(dynamic json) {
    _student = json['student'] != null ? StudentModel.fromJson(json['student']) : null;
    _token = json['token'];
  }
  StudentModel? _student;
  String? _token;
UserModel copyWith({  StudentModel? student,
  String? token,
}) => UserModel(  student: student ?? _student,
  token: token ?? _token,
);
  StudentModel? get student => _student;
  String? get token => _token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_student != null) {
      map['student'] = _student?.toJson();
    }
    map['token'] = _token;
    return map;
  }

}

/// id : 707
/// first_name : "أحمد"
/// last_name : "سعيد"
/// email : "mohamed@aa.com"
/// phone : "01234567899"
/// password : "$2y$10$QexC29iLqQS82bikhQcIGO5/dCCkAD/a7PzsCBhQ1qx9LbZyXvbn2"
/// image : null
/// university : null
/// faculty : null
/// department : null
/// city_id : 14
/// grade_id : 3
/// student_class_id : 12
/// student_section_id : 1
/// gender_id : 1
/// edara : "الساحل"
/// school : "ناصر"
/// parent_name : "سعيد"
/// parent_phone : "0123456789"
/// birthday : "2008-12-16"
/// bucket : 175
/// note : null
/// status : 1
/// last_session : "StwVakplH8MxiLMI0X7bw2rkznIHi9hFqlslpwg4"
/// created_by : null
/// created_at : "2022-04-19T07:23:06.000000Z"
/// updated_at : "2022-10-28T14:09:54.000000Z"

class StudentModel {
  Student({
      num? id, 
      String? firstName, 
      String? lastName, 
      String? email, 
      String? phone, 
      String? password, 
      dynamic image, 
      dynamic university, 
      dynamic faculty, 
      dynamic department, 
      num? cityId, 
      num? gradeId, 
      num? studentClassId, 
      num? studentSectionId, 
      int? genderId,
      String? edara, 
      String? school, 
      String? parentName, 
      String? parentPhone, 
      String? birthday, 
      num? bucket, 
      dynamic note, 
      num? status, 
      String? lastSession, 
      dynamic createdBy, 
      String? createdAt, 
      String? updatedAt,}){
    _id = id;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _phone = phone;
    _password = password;
    _image = image;
    _university = university;
    _faculty = faculty;
    _department = department;
    _cityId = cityId;
    _gradeId = gradeId;
    _studentClassId = studentClassId;
    _studentSectionId = studentSectionId;
    _genderId = genderId;
    _edara = edara;
    _school = school;
    _parentName = parentName;
    _parentPhone = parentPhone;
    _birthday = birthday;
    _bucket = bucket;
    _note = note;
    _status = status;
    _lastSession = lastSession;
    _createdBy = createdBy;
    _createdAt = createdAt;
    _updatedAt = updatedAt;
}

  StudentModel.fromJson(dynamic json) {
    _id = json['id'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _phone = json['phone'];
    _password = json['password'];
    _image = json['image'];
    _university = json['university'];
    _faculty = json['faculty'];
    _department = json['department'];
    _cityId = json['city_id'];
    _gradeId = json['grade_id'];
    _studentClassId = json['student_class_id'];
    _studentSectionId = json['student_section_id'];
    _genderId = json['gender_id'];
    _edara = json['edara'];
    _school = json['school'];
    _parentName = json['parent_name'];
    _parentPhone = json['parent_phone'];
    _birthday = json['birthday'];
    _bucket = json['bucket'];
    _note = json['note'];
    _status = json['status'];
    _lastSession = json['last_session'];
    _createdBy = json['created_by'];
    _createdAt = json['created_at'];
    _updatedAt = json['updated_at'];
  }
  num? _id;
  String? _firstName;
  String? _lastName;
  String? _email;
  String? _phone;
  String? _password;
  dynamic _image;
  dynamic _university;
  dynamic _faculty;
  dynamic _department;
  num? _cityId;
  num? _gradeId;
  num? _studentClassId;
  num? _studentSectionId;
  int? _genderId;
  String? _edara;
  String? _school;
  String? _parentName;
  String? _parentPhone;
  String? _birthday;
  num? _bucket;
  dynamic _note;
  num? _status;
  String? _lastSession;
  dynamic _createdBy;
  String? _createdAt;
  String? _updatedAt;
  StudentModel copyWith({  num? id,
  String? firstName,
  String? lastName,
  String? email,
  String? phone,
  String? password,
  dynamic image,
  dynamic university,
  dynamic faculty,
  dynamic department,
  num? cityId,
  num? gradeId,
  num? studentClassId,
  num? studentSectionId,
  int? genderId,
  String? edara,
  String? school,
  String? parentName,
  String? parentPhone,
  String? birthday,
  num? bucket,
  dynamic note,
  num? status,
  String? lastSession,
  dynamic createdBy,
  String? createdAt,
  String? updatedAt,
}) => Student(  id: id ?? _id,
  firstName: firstName ?? _firstName,
  lastName: lastName ?? _lastName,
  email: email ?? _email,
  phone: phone ?? _phone,
  password: password ?? _password,
  image: image ?? _image,
  university: university ?? _university,
  faculty: faculty ?? _faculty,
  department: department ?? _department,
  cityId: cityId ?? _cityId,
  gradeId: gradeId ?? _gradeId,
  studentClassId: studentClassId ?? _studentClassId,
  studentSectionId: studentSectionId ?? _studentSectionId,
  genderId: genderId ?? _genderId,
  edara: edara ?? _edara,
  school: school ?? _school,
  parentName: parentName ?? _parentName,
  parentPhone: parentPhone ?? _parentPhone,
  birthday: birthday ?? _birthday,
  bucket: bucket ?? _bucket,
  note: note ?? _note,
  status: status ?? _status,
  lastSession: lastSession ?? _lastSession,
  createdBy: createdBy ?? _createdBy,
  createdAt: createdAt ?? _createdAt,
  updatedAt: updatedAt ?? _updatedAt,
);
  num? get id => _id;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  String? get phone => _phone;
  String? get password => _password;
  dynamic get image => _image;
  dynamic get university => _university;
  dynamic get faculty => _faculty;
  dynamic get department => _department;
  num? get cityId => _cityId;
  num? get gradeId => _gradeId;
  num? get studentClassId => _studentClassId;
  num? get studentSectionId => _studentSectionId;
  int? get genderId => _genderId;
  String? get edara => _edara;
  String? get school => _school;
  String? get parentName => _parentName;
  String? get parentPhone => _parentPhone;
  String? get birthday => _birthday;
  num? get bucket => _bucket;
  dynamic get note => _note;
  num? get status => _status;
  String? get lastSession => _lastSession;
  dynamic get createdBy => _createdBy;
  String? get createdAt => _createdAt;
  String? get updatedAt => _updatedAt;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['phone'] = _phone;
    map['password'] = _password;
    map['image'] = _image;
    map['university'] = _university;
    map['faculty'] = _faculty;
    map['department'] = _department;
    map['city_id'] = _cityId;
    map['grade_id'] = _gradeId;
    map['student_class_id'] = _studentClassId;
    map['student_section_id'] = _studentSectionId;
    map['gender_id'] = _genderId;
    map['edara'] = _edara;
    map['school'] = _school;
    map['parent_name'] = _parentName;
    map['parent_phone'] = _parentPhone;
    map['birthday'] = _birthday;
    map['bucket'] = _bucket;
    map['note'] = _note;
    map['status'] = _status;
    map['last_session'] = _lastSession;
    map['created_by'] = _createdBy;
    map['created_at'] = _createdAt;
    map['updated_at'] = _updatedAt;
    return map;
  }

}