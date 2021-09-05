import 'package:english_quiz_flutter/src/core/utils/constants.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserInfoDao {
  @Query('SELECT * FROM $kUserInfoTableName')
  Future<UserInfo?> getUserInfo();

  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertUserInfo(UserInfo userInfo);

  @Update(onConflict: OnConflictStrategy.replace)
  Future<void> updateUserInfo(UserInfo userInfo);

  @delete
  Future<void> deleteUserInfo(UserInfo userInfo);
}
