part of 'user_info_bloc.dart';

abstract class UserInfoState extends Equatable {
  const UserInfoState();

  @override
  List<Object> get props => [];
}

class UserInfoInitial extends UserInfoState {}

class UserInfoLoading extends UserInfoState {}

class UserInfoSuccess extends UserInfoState {
  final UserInfo userInfo;
  const UserInfoSuccess(this.userInfo);

  @override
  List<Object> get props => [userInfo];
}

class UserInfoError extends UserInfoState {
  final DioError errorObj;
  const UserInfoError(this.errorObj);

  @override
  List<Object> get props => [errorObj];
}
