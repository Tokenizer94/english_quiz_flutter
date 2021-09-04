import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required String result,
  }) : super(
          result: result,
        );

  factory AuthModel.fromJson(Map<String, dynamic> map) => AuthModel(
        result: map['result'] as String,
      );
}
