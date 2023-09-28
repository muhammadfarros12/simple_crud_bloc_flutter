import 'dart:convert';

class LoginModel {
  final String name;
  final String password;
  LoginModel({
    required this.name,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'password': password,
    };
  }

  factory LoginModel.fromMap(Map<String, dynamic> map) {
    return LoginModel(
      name: map['name'] ?? '',
      password: map['password'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginModel.fromJson(String source) => LoginModel.fromMap(json.decode(source));
}
