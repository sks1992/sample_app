import 'login_model.dart';

class RegisterPostModel {
  RegisterPostModel({
    required this.userName,
    required this.email,
    required this.password,
    required this.role,
    required this.base64ImageUrl,
  });

  late final String userName;
  late final String email;
  late final String password;
  late final String role;
  late final String base64ImageUrl;

  RegisterPostModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
    base64ImageUrl = json['base64ImageUrl'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    _data['email'] = email;
    _data['password'] = password;
    _data['role'] = role;
    _data['base64ImageUrl'] = base64ImageUrl;
    return _data;
  }
}

class RegisterResultModel {
  RegisterResultModel({
    this.statusCode,
   required this.isSuccess,
    this.errorMessages,
    this.result,
  });

  late final int? statusCode;
  late final bool isSuccess;
  late final List<dynamic>? errorMessages;
  late final Result? result;

  RegisterResultModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = List.castFrom<dynamic, dynamic>(json['errorMessages']);
    result = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['isSuccess'] = isSuccess;
    _data['errorMessages'] = errorMessages;
    _data['result'] = result;
    return _data;
  }
}
