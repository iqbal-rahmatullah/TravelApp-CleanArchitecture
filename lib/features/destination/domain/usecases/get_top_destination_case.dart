import 'package:dartz/dartz.dart';
import 'package:travel_app_clean_architecture/core/error/failure.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/repositories/destination_repositories.dart';

class GetTopDestinationCase {
  final DestinationRepository _repository;

  GetTopDestinationCase(this._repository);

  Future<Either<Failure, List<DestinationEntity>>> call() {
    return _repository.top();
  }
}
