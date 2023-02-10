/// message : "The given data was invalid."
/// errors : {"email":["قيمة حقل email مُستخدمة من قبل."],"phone":["قيمة حقل phone مُستخدمة من قبل."]}

class ErrorModel {
  ErrorModel({
    String? message,
    Errors? errors,
  }) {
    _message = message;
    _errors = errors;
  }

  ErrorModel.fromJson(dynamic json) {
    _message = json['message'];
    _errors = json['errors'] != null ? Errors.fromJson(json['errors']) : null;
  }

  String? _message;
  Errors? _errors;

  ErrorModel copyWith({
    String? message,
    Errors? errors,
  }) =>
      ErrorModel(
        message: message ?? _message,
        errors: errors ?? _errors,
      );

  String? get message => _message;

  Errors? get errors => _errors;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['message'] = _message;
    if (_errors != null) {
      map['errors'] = _errors?.toJson();
    }
    return map;
  }
}

/// email : ["قيمة حقل email مُستخدمة من قبل."]
/// phone : ["قيمة حقل phone مُستخدمة من قبل."]

class Errors {
  Errors({
    List<String>? email,
    List<String>? birthday,
    List<String>? phone,
  }) {
    _email = email;
    _phone = phone;
    _birthday = birthday;
  }

  Errors.fromJson(dynamic json) {
    _email = json['email'] != null ? json['email'].cast<String>() : [];
    _phone = json['phone'] != null ? json['phone'].cast<String>() : [];
    _birthday = json['birthday'] != null ? json['birthday'].cast<String>() : [];
  }

  List<String>? _email;
  List<String>? _phone;
  List<String>? _birthday;

  Errors copyWith({
    List<String>? email,
    List<String>? phone,
    List<String>? birthday,
  }) =>
      Errors(
        email: email ?? _email,
        phone: phone ?? _phone,
        birthday: birthday ?? _birthday,
      );

  List<String>? get email => _email;

  List<String>? get phone => _phone;
  List<String>? get birthday => _birthday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['email'] = _email;
    map['phone'] = _phone;
    map['birthday'] = _birthday;
    return map;
  }
}
