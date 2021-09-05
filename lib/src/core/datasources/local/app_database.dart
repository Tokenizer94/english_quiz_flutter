import 'dart:async';

import 'package:english_quiz_flutter/src/core/datasources/local/DAOs/user_info_dao.dart';
import 'package:english_quiz_flutter/src/features/authentication/domain/entities/user_info.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'app_database.g.dart';

@Database(version: 1, entities: [UserInfo])
abstract class AppDatabase extends FloorDatabase {
  UserInfoDao get userInfoDao;
}
