import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/search_destination_case.dart';

part 'search_destination_event.dart';
part 'search_destination_state.dart';

class SearchDestinationBloc
    extends Bloc<SearchDestinationEvent, SearchDestinationState> {
  final SearchDestinationCase _searchDestinationCase;

  SearchDestinationBloc(this._searchDestinationCase)
      : super(SearchDestinationInitial()) {
    on<OnSearchDestination>((event, emit) async {
      emit(SearchDestinationLoading());
      final result = await _searchDestinationCase.call(event.query);
      result.fold((failure) => SearchDestinationFailure(failure.message),
          (data) => SearchDestinationLoaded(data));
    });
  }
}
