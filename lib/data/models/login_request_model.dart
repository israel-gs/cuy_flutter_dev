class LoginRequestModel {
  final String emailOrPhone;
  final String password;

  const LoginRequestModel({
    required this.emailOrPhone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailOrPhone': emailOrPhone,
      'password': password,
    };
  }

  factory LoginRequestModel.fromJson(Map<String, dynamic> json) {
    return LoginRequestModel(
      emailOrPhone: json['emailOrPhone'],
      password: json['password'],
    );
  }
}
