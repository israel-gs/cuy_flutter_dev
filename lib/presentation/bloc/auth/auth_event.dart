part of 'auth_bloc.dart';

sealed class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

final class AuthStarted extends AuthEvent {
  final String email;
  final String password;

  const AuthStarted({
    required this.email,
    required this.password,
  });

  @override
  List<Object> get props => [email, password];
}
