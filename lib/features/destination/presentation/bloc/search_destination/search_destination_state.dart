part of 'search_destination_bloc.dart';

sealed class SearchDestinationState extends Equatable {
  const SearchDestinationState();

  @override
  List<Object> get props => [];
}

final class SearchDestinationInitial extends SearchDestinationState {}

final class SearchDestinationLoading extends SearchDestinationState {}

final class SearchDestinationLoaded extends SearchDestinationState {
  final List<DestinationEntity> destinations;

  SearchDestinationLoaded(this.destinations);

  @override
  List<Object> get props => [destinations];
}

final class SearchDestinationFailure extends SearchDestinationState {
  final String message;

  SearchDestinationFailure(this.message);

  @override
  List<Object> get props => [message];
}
