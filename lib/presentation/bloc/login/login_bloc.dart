import 'package:cuy_flutter_dev/domain/entities/login_entity.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_token_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/post_login_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLoginUseCase _postLoginUseCase;
  final GetTokenUseCase _getTokenUseCase;

  LoginBloc(
    this._postLoginUseCase,
    this._getTokenUseCase,
  ) : super(LoginInitial()) {
    on<LoginStarted>(_onLoginStarted);
  }

  void _onLoginStarted(LoginStarted event, Emitter<LoginState> emit) async {
    emit(LoginLoading());

    String? token = await _getTokenUseCase.call();

    if (token == null) {
      emit(const LoginFailure('Token not found'));
      return;
    }

    final result = await _postLoginUseCase.call(
      authorization: 'Cuy-oauthtoken $token',
      emailOrPhone: event.emailOrPhone,
      password: event.password,
    );

    result.fold(
      (failure) => emit(LoginFailure(failure.message)),
      (success) async {
        if (success.data == null) {
          emit(const LoginFailure('Data not found'));
        } else {
          emit(LoginSuccess(success.data!));
        }
      },
    );
  }
}
