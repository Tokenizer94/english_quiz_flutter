import 'dart:convert';

import 'package:english_quiz_flutter/src/features/authentication/data/models/auth_model.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';


class AuthResponseModel {
  final int status;
  final Auth auth;
  AuthResponseModel({
    required this.status,
    required this.auth,
  });

  factory AuthResponseModel.fromMap(Map<String, dynamic> map) {
    return AuthResponseModel(
      status: map['status'] as int,
      auth: AuthModel.fromJson(map['auth'] as String),
    );
  }

  factory AuthResponseModel.fromJson(String source) => AuthResponseModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
