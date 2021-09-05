part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final Auth auth;
  final String fullname;
  final String phoneNumber;
  const AuthSuccess({
    required this.auth,
    required this.fullname,
    required this.phoneNumber,
  });

  @override
  List<Object> get props => [auth];
}

class AuthError extends AuthState {
  final DioError errorObj;
  const AuthError(this.errorObj);

  @override
  List<Object> get props => [errorObj];
}
