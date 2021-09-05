class LoginRequestParams {
  final String fullname;
  final String phoneNumber;
  final String verifyCode;
  LoginRequestParams({
    required this.fullname,
    required this.phoneNumber,
    required this.verifyCode,
  });
}
