part of 'top_destination_bloc.dart';

sealed class TopDestinationState extends Equatable {
  const TopDestinationState();

  @override
  List<Object> get props => [];
}

final class TopDestinationInitial extends TopDestinationState {}

final class TopDestinationLoading extends TopDestinationState {}

final class TopDestinationLoaded extends TopDestinationState {
  final List<DestinationEntity> destinations;

  TopDestinationLoaded(this.destinations);

  List<Object> get props => [destinations];
}

final class TopDestinationFailure extends TopDestinationState {
  final String message;

  TopDestinationFailure(this.message);

  @override
  List<Object> get props => [message];
}
