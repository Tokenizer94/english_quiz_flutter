part of 'local_user_info_bloc.dart';

abstract class LocalUserInfoEvent extends Equatable {
  const LocalUserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetSavedUserinfo extends LocalUserInfoEvent {}

class SaveUserInfo extends LocalUserInfoEvent {
  final UserInfo userInfo;
  const SaveUserInfo({
    required this.userInfo,
  });

  @override
  List<Object> get props => [userInfo];
}

class UpdateUserInfo extends LocalUserInfoEvent {
  final UserInfo userInfo;
  const UpdateUserInfo({
    required this.userInfo,
  });

  @override
  List<Object> get props => [userInfo];
}

class RemoveUserInfo extends LocalUserInfoEvent {
  final UserInfo userInfo;
  const RemoveUserInfo({
    required this.userInfo,
  });

  @override
  List<Object> get props => [userInfo];
}