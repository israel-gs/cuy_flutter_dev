class AuthRequestModel {
  final String email;
  final String password;

  const AuthRequestModel({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
    };
  }

  factory AuthRequestModel.fromJson(Map<String, dynamic> json) {
    return AuthRequestModel(
      email: json['email'],
      password: json['password'],
    );
  }
}
