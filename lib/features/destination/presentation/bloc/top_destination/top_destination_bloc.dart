import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/get_top_destination_case.dart';

part 'top_destination_event.dart';
part 'top_destination_state.dart';

class TopDestinationBloc
    extends Bloc<TopDestinationEvent, TopDestinationState> {
  final GetTopDestinationCase getTopDestinationCase;

  TopDestinationBloc(this.getTopDestinationCase)
      : super(TopDestinationInitial()) {
    on<OnGetTopDestination>((event, emit) async {
      emit(TopDestinationLoading());
      final result = await getTopDestinationCase();
      result.fold((failure) => emit(TopDestinationFailure(failure.message)),
          (data) => emit(TopDestinationLoaded(data)));
    });
  }
}
