import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';

class UserInfoModel extends UserInfo {
  const UserInfoModel({
    required String fullname,
    required String phoneNumber,
    required String token,
  }) : super(
          fullname: fullname,
          phoneNumber: phoneNumber,
          token: token,
        );

  factory UserInfoModel.fromJson(Map<String, dynamic> map) => UserInfoModel(
        fullname: map['fullname'] as String,
        phoneNumber: map['phone_number'] as String,
        token: map['token'] as String,
      );
}
