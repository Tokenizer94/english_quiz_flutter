// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$AppDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$AppDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$AppDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  UserInfoDao? _userInfoDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `user_info_table` (`id` INTEGER NOT NULL, `fullname` TEXT NOT NULL, `phoneNumber` TEXT NOT NULL, `token` TEXT NOT NULL, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  UserInfoDao get userInfoDao {
    return _userInfoDaoInstance ??= _$UserInfoDao(database, changeListener);
  }
}

class _$UserInfoDao extends UserInfoDao {
  _$UserInfoDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _userInfoInsertionAdapter = InsertionAdapter(
            database,
            'user_info_table',
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'fullname': item.fullname,
                  'phoneNumber': item.phoneNumber,
                  'token': item.token
                }),
        _userInfoUpdateAdapter = UpdateAdapter(
            database,
            'user_info_table',
            ['id'],
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'fullname': item.fullname,
                  'phoneNumber': item.phoneNumber,
                  'token': item.token
                }),
        _userInfoDeletionAdapter = DeletionAdapter(
            database,
            'user_info_table',
            ['id'],
            (UserInfo item) => <String, Object?>{
                  'id': item.id,
                  'fullname': item.fullname,
                  'phoneNumber': item.phoneNumber,
                  'token': item.token
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<UserInfo> _userInfoInsertionAdapter;

  final UpdateAdapter<UserInfo> _userInfoUpdateAdapter;

  final DeletionAdapter<UserInfo> _userInfoDeletionAdapter;

  @override
  Future<UserInfo?> getUserInfo() async {
    return _queryAdapter.query('SELECT * FROM user_info_table',
        mapper: (Map<String, Object?> row) => UserInfo(
            id: row['id'] as int,
            fullname: row['fullname'] as String,
            phoneNumber: row['phoneNumber'] as String,
            token: row['token'] as String));
  }

  @override
  Future<void> insertUserInfo(UserInfo userInfo) async {
    await _userInfoInsertionAdapter.insert(
        userInfo, OnConflictStrategy.replace);
  }

  @override
  Future<void> updateUserInfo(UserInfo userInfo) async {
    await _userInfoUpdateAdapter.update(userInfo, OnConflictStrategy.replace);
  }

  @override
  Future<void> deleteUserInfo(UserInfo userInfo) async {
    await _userInfoDeletionAdapter.delete(userInfo);
  }
}
