part of 'search_destination_bloc.dart';

sealed class SearchDestinationEvent extends Equatable {
  const SearchDestinationEvent();

  @override
  List<Object> get props => [];
}

final class OnSearchDestination extends SearchDestinationEvent {
  final String query;

  OnSearchDestination(this.query);

  @override
  // TODO: implement props
  List<Object> get props => [query];
}
