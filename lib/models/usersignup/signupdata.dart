import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:v_connect/models/usersignup/signupdata.dart';
import 'dart:async';
import 'dart:convert';

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
