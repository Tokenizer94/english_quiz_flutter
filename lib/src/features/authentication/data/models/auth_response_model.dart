import 'package:english_quiz_flutter/src/features/authentication/data/models/auth_model.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/auth.dart';

class AuthResponseModel {
  final int status;
  final Auth auth;
  AuthResponseModel({
    required this.status,
    required this.auth,
  });

  factory AuthResponseModel.fromJson(Map<String, dynamic> map) => AuthResponseModel(
        status: map['status'] as int,
        auth: AuthModel.fromJson(map['data'] as Map<String, dynamic>),
      );
}
