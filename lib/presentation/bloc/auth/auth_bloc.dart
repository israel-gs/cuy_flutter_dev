import 'package:cuy_flutter_dev/domain/usecases/post_auth_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/save_token_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final PostAuthUseCase _postAuthUseCase;
  final SaveTokenUseCase _saveTokenUseCase;

  AuthBloc(
    this._postAuthUseCase,
    this._saveTokenUseCase,
  ) : super(AuthInitial()) {
    on<AuthStarted>(_onAuthStarted);
  }

  Future<void> _onAuthStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());
    final result = await _postAuthUseCase.call(
      email: event.email,
      password: event.password,
    );
    await result.fold(
      (failure) async {
        emit(AuthFailure(failure.message));
      },
      (success) async {
        await _saveTokenUseCase.call(token: success.oauthToken);
        emit(AuthSuccess(success.oauthToken));
      },
    );
  }
}
