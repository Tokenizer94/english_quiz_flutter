part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class SendAuthSMS extends AuthEvent {
  final String fullname;
  final String phoneNumber;
  const SendAuthSMS({ required this.fullname,required this.phoneNumber});

  @override
  List<Object> get props => [fullname, phoneNumber];
}
