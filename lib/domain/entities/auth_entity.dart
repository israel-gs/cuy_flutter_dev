import 'package:equatable/equatable.dart';

class AuthEntity extends Equatable {
  final String code;
  final String status;
  final String message;
  final String oauthToken;

  const AuthEntity({
    required this.code,
    required this.status,
    required this.message,
    required this.oauthToken,
  });

  @override
  List<Object?> get props => [
        code,
        status,
        message,
        oauthToken,
      ];
}
