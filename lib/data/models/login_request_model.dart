class LoginRequestModel {
  final String emailOrPhone;
  final String password;

  const LoginRequestModel({
    required this.emailOrPhone,
    required this.password,
  });
}
