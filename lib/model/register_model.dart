/// first_name : "Kareem"
/// last_name : "Adel"
/// email : "Kareem@kas.com"
/// phone : "01234567771"
/// password : "12345678"
/// password2 : "12345678"
/// city_id : "1"
/// grade_id : "3"
/// student_class_id : "13"
/// student_section_id : "1"
/// gender_id : "1"
/// edara : "فيصل"
/// school : "ناصر"
/// parent_name : "عادل"
/// parent_phone : "01234567777"
/// birthday : "20 -2 -2000"

class RegisterModel {
  RegisterModel({
    String? firstName,
    String? lastName,
    String? email,
    String? faculty,
    String? department,
    String? university,
    String? phone,
    String? password,
    String? password2,
    String? cityId,
    String? gradeId,
    String? studentClassId,
    String? studentSectionId,
    String? genderId,
    String? edara,
    String? school,
    String? parentName,
    String? parentPhone,
    String? birthday,
    String? token,
    String? deviceId,
  }) {
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _faculty = faculty;
    _department = department;
    _university = university;
    _phone = phone;
    _password = password;
    _password2 = password2;
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
    _token = token;
    _deviceId = deviceId;
  }

  RegisterModel.fromJson(dynamic json) {
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _faculty = json['faculty'];
    _department = json['department'];
    _university = json['university'];
    _phone = json['phone'];
    _password = json['password'];
    _password2 = json['password2'];
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
    _token = json['token'];
    _deviceId = json['device_id'];
  }

  String? _firstName;
  String? _lastName;
  String? _email;
  String? _faculty;

  String? _department;
  String? _university;
  String? _phone;
  String? _password;
  String? _password2;
  String? _cityId;
  String? _gradeId;
  String? _studentClassId;
  String? _studentSectionId;
  String? _genderId;
  String? _edara;
  String? _school;
  String? _parentName;
  String? _parentPhone;
  String? _birthday;
  String? _token;
  String? _deviceId;

  RegisterModel copyWith({
    String? firstName,
    String? lastName,
    String? email,
    String? faculty,
    String? department,
    String? university,
    String? phone,
    String? password,
    String? password2,
    String? cityId,
    String? gradeId,
    String? studentClassId,
    String? studentSectionId,
    String? genderId,
    String? edara,
    String? school,
    String? parentName,
    String? parentPhone,
    String? birthday,
    String? token,
    String? deviceId,
  }) =>
      RegisterModel(
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        faculty: faculty ?? _faculty,
        department: department ?? _department,
        university: university ?? _university,
        phone: phone ?? _phone,
        password: password ?? _password,
        password2: password2 ?? _password2,
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
        token: token ?? _token,
        deviceId: deviceId ?? _deviceId,
      );

  String? get firstName => _firstName;

  String? get lastName => _lastName;

  String? get email => _email;
  String? get faculty    => _faculty   ;
  String? get department => _department;

  String? get university => _university;

  String? get phone => _phone;

  String? get password => _password;

  String? get password2 => _password2;

  String? get cityId => _cityId;

  String? get gradeId => _gradeId;

  String? get studentClassId => _studentClassId;

  String? get studentSectionId => _studentSectionId;

  String? get genderId => _genderId;

  String? get edara => _edara;

  String? get school => _school;

  String? get parentName => _parentName;

  String? get parentPhone => _parentPhone;

  String? get birthday => _birthday;

  String? get token => _token;

  String? get deviceId => _deviceId;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['first_name'] = _firstName??'';
    map['last_name'] = _lastName??'';
    map['email'] = _email??'';
    map['faculty'] = _faculty??''   ;
    map['department'] = _department??'';
    map['university'] = _university??'';
    map['phone'] = _phone??'';
    map['password'] = _password??'';
    map['password2'] = _password2??'';
    map['city_id'] = _cityId??  '';
    map['grade_id'] = _gradeId??'';
    map['student_class_id'] = _studentClassId?? '';
    map['student_section_id'] = _studentSectionId??'';
    map['gender_id'] = _genderId??'';
    map['edara'] = _edara??'';
    map['school'] = _school??'';
    map['parent_name'] = _parentName??'';
    map['parent_phone'] = _parentPhone??'';
    map['birthday'] = _birthday??'';
    map['token'] = _token??'';
    map['device_id'] = _deviceId??'';
    return map;
  }
}
