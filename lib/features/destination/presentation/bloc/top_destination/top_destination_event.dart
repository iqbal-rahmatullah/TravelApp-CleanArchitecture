part of 'top_destination_bloc.dart';

sealed class TopDestinationEvent extends Equatable {
  const TopDestinationEvent();

  @override
  List<Object> get props => [];
}

final class OnGetTopDestination extends TopDestinationEvent {}
