import 'package:english_quiz_flutter/src/features/authentication/data/models/user_info_model.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';

class UserInfoResponseModel {
  final int status;
  final UserInfo userInfo;
  UserInfoResponseModel({
    required this.status,
    required this.userInfo,
  });

  factory UserInfoResponseModel.fromJson(Map<String, dynamic> map) => UserInfoResponseModel(
        status: map['status'] as int,
        userInfo: UserInfoModel.fromJson(map['data'] as Map<String, dynamic>),
      );
}
