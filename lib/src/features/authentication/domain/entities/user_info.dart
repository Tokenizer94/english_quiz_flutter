import 'package:english_quiz_flutter/src/core/utils/constants.dart';
import 'package:equatable/equatable.dart';
import 'package:floor/floor.dart';

@Entity(tableName: kUserInfoTableName)
class UserInfo extends Equatable {
  @PrimaryKey(autoGenerate: false)
  final int id;
  final String fullname;
  final String phoneNumber;
  final String token;
  const UserInfo({
    this.id = 1,
    required this.fullname,
    required this.phoneNumber,
    required this.token,
  });

  @override
  List<Object?> get props => [fullname, phoneNumber, token];

  @override
  bool? get stringify => true;
}
