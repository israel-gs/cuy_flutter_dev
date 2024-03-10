part of 'login_bloc.dart';

sealed class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

final class LoginStarted extends LoginEvent {
  final String emailOrPhone;
  final String password;

  const LoginStarted({
    required this.emailOrPhone,
    required this.password,
  });

  @override
  List<Object> get props => [emailOrPhone, password];
}
