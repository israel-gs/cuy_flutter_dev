part of 'login_bloc.dart';

sealed class LoginState extends Equatable {
  final DataEntity? dataEntity;
  final String? errorMessage;

  const LoginState({
    this.dataEntity,
    this.errorMessage,
  });

  @override
  List<Object> get props => [
        dataEntity!,
        errorMessage!,
      ];
}

final class LoginInitial extends LoginState {}

final class LoginLoading extends LoginState {}

final class LoginSuccess extends LoginState {
  const LoginSuccess(DataEntity dataEntity) : super(dataEntity: dataEntity);

  @override
  List<Object> get props => [dataEntity!];
}

final class LoginFailure extends LoginState {
  const LoginFailure(String errorMessage) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [errorMessage!];
}
