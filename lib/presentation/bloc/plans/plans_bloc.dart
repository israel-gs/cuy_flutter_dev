import 'package:cuy_flutter_dev/domain/entities/plans_entity.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_active_plans_usecase.dart';
import 'package:cuy_flutter_dev/domain/usecases/get_token_usecase.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'plans_event.dart';
part 'plans_state.dart';

class PlansBloc extends Bloc<PlansEvent, PlansState> {
  final GetActivePlansUseCase _getActivePlansUseCase;
  final GetTokenUseCase _getTokenUseCase;

  PlansBloc(
    this._getActivePlansUseCase,
    this._getTokenUseCase,
  ) : super(PlansInitial()) {
    on<PlansStarted>(_onPlansStarted);
  }

  void _onPlansStarted(PlansStarted event, Emitter<PlansState> emit) async {
    emit(PlansLoading());

    String? token = await _getTokenUseCase.call();

    if (token == null) {
      emit(const PlansFailure('Token not found'));
      return;
    }

    final result = await _getActivePlansUseCase.call(
      authorization: 'Cuy-oauthtoken $token',
    );

    result.fold(
      (failure) => emit(PlansFailure(failure.message)),
      (success) async {
        if (success.list == null || success.list!.isEmpty) {
          emit(const PlansFailure('Data not found'));
        } else {
          emit(PlansSuccess(success.list!));
        }
      },
    );
  }
}
