import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/usecases/get_all_destinations_case.dart';

part 'all_destination_event.dart';
part 'all_destination_state.dart';

class AllDestinationBloc
    extends Bloc<AllDestinationEvent, AllDestinationState> {
  final GetAllDestinationCase _getAllDestinationCase;

  AllDestinationBloc(this._getAllDestinationCase)
      : super(AllDestinationInitial()) {
    on<OnGetAllDestination>((event, emit) async {
      emit(AllDestinationLoading());
      final result = await _getAllDestinationCase();
      result.fold((failure) => emit(AllDestinationFailure(failure.message)),
          (data) => emit(AllDestinationLoaded(data)));
    });
  }
}
