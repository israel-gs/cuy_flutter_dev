part of 'plans_bloc.dart';

sealed class PlansState extends Equatable {
  final List<ListElementEntity?>? plans;
  final String? errorMessage;

  const PlansState({
    this.plans,
    this.errorMessage,
  });

  @override
  List<Object> get props => [
        plans!,
      ];
}

final class PlansInitial extends PlansState {}

final class PlansLoading extends PlansState {}

final class PlansSuccess extends PlansState {
  const PlansSuccess(List<ListElementEntity?> plans) : super(plans: plans);

  @override
  List<Object> get props => [plans!];
}

final class PlansFailure extends PlansState {
  const PlansFailure(String errorMessage) : super(errorMessage: errorMessage);

  @override
  List<Object> get props => [errorMessage!];
}
