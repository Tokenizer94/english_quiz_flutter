import 'dart:convert';

import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required String result,
  }) : super(
          result: result,
        );

  factory AuthModel.fromMap(Map<String, dynamic> map) {
    return AuthModel(
      result: map['result'] as String,
    );
  }

  factory AuthModel.fromJson(String source) => AuthModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );
}
