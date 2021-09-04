part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  final String phoneNumber;
  const AuthEvent({
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [phoneNumber];
}

class SendAuthSMS extends AuthEvent {
  const SendAuthSMS(String phoneNumber)
      : super(
          phoneNumber: phoneNumber,
        );
}
