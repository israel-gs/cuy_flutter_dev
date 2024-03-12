part of 'plans_bloc.dart';

sealed class PlansState extends Equatable {
  const PlansState();

  @override
  List<Object> get props => [];
}

final class PlansInitial extends PlansState {}

final class PlansLoading extends PlansState {}

final class PlansSuccess extends PlansState {
  final List<ListElementEntity> plans;
  const PlansSuccess(this.plans);

  @override
  List<Object> get props => [plans];
}

final class PlansFailure extends PlansState {
  final String errorMessage;
  const PlansFailure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
