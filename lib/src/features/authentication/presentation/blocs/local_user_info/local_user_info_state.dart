part of 'local_user_info_bloc.dart';

abstract class LocalUserInfoState extends Equatable {
  const LocalUserInfoState();

  @override
  List<Object> get props => [];
}

class LocalUserInfoLoading extends LocalUserInfoState {}

class LocalUserInfoDone extends LocalUserInfoState {
  final UserInfo userInfo;
  const LocalUserInfoDone({
    required this.userInfo,
  });

  @override
  List<Object> get props => [userInfo];
}
