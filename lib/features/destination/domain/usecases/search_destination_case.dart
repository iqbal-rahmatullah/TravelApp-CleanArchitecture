import 'package:dartz/dartz.dart';
import 'package:travel_app_clean_architecture/core/error/failure.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/repositories/destination_repositories.dart';

class SearchDestinationCase {
  final DestinationRepository _repository;

  SearchDestinationCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call(String query) {
    return _repository.search(query);
  }
}
