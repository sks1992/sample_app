class LoginRequestModel {
  LoginRequestModel({
    required this.userName,
    required this.password,
  });

  late final String userName;
  late final String password;

  LoginRequestModel.fromJson(Map<String, dynamic> json) {
    userName = json['userName'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['userName'] = userName;
    _data['password'] = password;
    return _data;
  }
}

class LoginResultModel {
  LoginResultModel({
    this.statusCode,
    required this.isSuccess,
    this.errorMessages,
    this.result,
  });

  late final int? statusCode;
  late final bool isSuccess;
  late final List<dynamic>? errorMessages;
  late final Result? result;

  LoginResultModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['statusCode'];
    isSuccess = json['isSuccess'];
    errorMessages = List.castFrom<dynamic, dynamic>(json['errorMessages']);
    result = Result.fromJson(json['result']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['statusCode'] = statusCode;
    _data['isSuccess'] = isSuccess;
    _data['errorMessages'] = errorMessages;
    _data['result'] = result!.toJson();
    return _data;
  }
}

class Result {
  Result({
    required this.user,
    required this.token,
  });

  late final User user;
  late final String token;

  Result.fromJson(Map<String, dynamic> json) {
    user = User.fromJson(json['user']);
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['user'] = user.toJson();
    _data['token'] = token;
    return _data;
  }
}

class User {
  User({
    required this.id,
    required this.userName,
    required this.email,
    required this.password,
    required this.role,
  });

  late final int id;
  late final String userName;
  late final String email;
  late final String password;
  late final String role;

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userName = json['userName'];
    email = json['email'];
    password = json['password'];
    role = json['role'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['userName'] = userName;
    _data['email'] = email;
    _data['password'] = password;
    _data['role'] = role;
    return _data;
  }
}
