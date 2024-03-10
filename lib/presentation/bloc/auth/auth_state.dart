part of 'auth_bloc.dart';

sealed class AuthState extends Equatable {
  final String? oauthToken;
  final String? errorMessage;

  const AuthState({
    this.oauthToken,
    this.errorMessage,
  });

  @override
  List<Object> get props => [
        oauthToken!,
        errorMessage!,
      ];
}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  const AuthSuccess(String oauthToken) : super(oauthToken: oauthToken);

  @override
  List<Object> get props => [oauthToken!];
}

final class AuthFailure extends AuthState {
  const AuthFailure(String errorMessage) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [errorMessage!];
}
