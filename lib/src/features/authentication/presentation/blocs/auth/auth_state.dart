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
  const AuthSuccess(this.auth);

  @override
  List<Object> get props => [auth];
}

class AuthError extends AuthState {
  final DioError errorObj;
  const AuthError(this.errorObj);

  @override
  List<Object> get props => [errorObj];
}
