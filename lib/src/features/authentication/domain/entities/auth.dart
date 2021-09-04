import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String result;
  const Auth({
    required this.result,
  });

  @override
  List<Object?> get props => [result];
  
  @override
  bool? get stringify => true;
}
