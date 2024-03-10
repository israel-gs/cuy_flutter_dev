part of 'plans_bloc.dart';

sealed class PlansEvent extends Equatable {
  const PlansEvent();

  @override
  List<Object> get props => [];
}

class PlansStarted extends PlansEvent {
  const PlansStarted();
}
