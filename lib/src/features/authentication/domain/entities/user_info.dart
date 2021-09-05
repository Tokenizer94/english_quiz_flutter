import 'package:equatable/equatable.dart';

class UserInfo extends Equatable {
  final String fullname;
  final String phoneNumber;
  final String token;
  const UserInfo({
    required this.fullname,
    required this.phoneNumber,
    required this.token,
  });

  @override
  List<Object?> get props => [fullname,phoneNumber,token];

  @override
  bool? get stringify => true;
}
