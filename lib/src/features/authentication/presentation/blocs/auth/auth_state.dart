part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  final Auth? auth;

  final DioError? error;

  const AuthState({this.auth, this.error});

  @override
  List<Object?> get props => [auth, error];
}

class AuthInitial extends AuthState {
  const AuthInitial();
}

class AuthLoading extends AuthState {
  const AuthLoading();
}

class AuthSuccess extends AuthState {
  const AuthSuccess(Auth auth) : super(auth: auth);
}

class AuthError extends AuthState {
  const AuthError(DioError error) : super(error: error);
}
