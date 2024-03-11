import 'package:cuy_flutter_dev/domain/entities/auth_entity.dart';

class AuthModel extends AuthEntity {
  const AuthModel({
    required super.code,
    required super.status,
    required super.message,
    required super.oauthToken,
  });

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      code: json['code'],
      status: json['status'],
      message: json['message'],
      oauthToken: json['oauthToken'],
    );
  }
}
