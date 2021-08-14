import 'dart:convert';

// ignore: non_constant_identifier_names
SignupData SignupDataFromJson(String str) =>
    SignupData.fromJson(json.decode(str));

class SignupData {
  final String name;
  final String email;
  final String password;

  SignupData({required this.name, required this.email, required this.password});

  factory SignupData.fromJson(Map<String, dynamic> json) {
    return SignupData(
      name: json['name'],
      email: json['email'],
      password: json['password'],
    );
  }
  Map<String, dynamic> toJson() =>
      {"name": name, "email": email, "password": password};
}
