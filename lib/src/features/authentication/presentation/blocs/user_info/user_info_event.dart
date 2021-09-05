part of 'user_info_bloc.dart';

abstract class UserInfoEvent extends Equatable {
  const UserInfoEvent();

  @override
  List<Object> get props => [];
}

class GetUserInfo extends UserInfoEvent {
  final String fullname;
  final String phoneNumber;
  final String verifyCode;
  const GetUserInfo({
    required this.fullname,
    required this.phoneNumber,
    required this.verifyCode,
  });

  @override
  List<Object> get props => [fullname, phoneNumber, verifyCode];
}
