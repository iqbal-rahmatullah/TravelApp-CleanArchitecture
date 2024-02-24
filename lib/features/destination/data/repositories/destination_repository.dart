import 'dart:async';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:travel_app_clean_architecture/core/error/exception.dart';
import 'package:travel_app_clean_architecture/core/error/failure.dart';
import 'package:travel_app_clean_architecture/core/platform/network_info.dart';
import 'package:travel_app_clean_architecture/features/destination/data/datasource/destination_local_datasource.dart';
import 'package:travel_app_clean_architecture/features/destination/data/datasource/destination_remote_datasource.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/entities/destination_entity.dart';
import 'package:travel_app_clean_architecture/features/destination/domain/repositories/destination_repositories.dart';

class DestinationRepositoryImpl implements DestinationRepository {
  final DestinationRemoteDataSource remoteDataSource;
  final DestinationLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DestinationRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<DestinationEntity>>> all() async {
    bool isConnected = await networkInfo.isConnected();
    if (isConnected) {
      try {
        final result = await remoteDataSource.all();
        await localDataSource.cache(result);
        return Right(result.map((e) => e.toEntity).toList());
      } on TimeoutException {
        return Left(TimeOutFailure(message: "Timeout. No Response"));
      } on ServerExcetion {
        return Left(ServerFailure(message: "Server Error"));
      } on NotFoundException {
        return Left(NotFoundFailure(message: "Not Found"));
      }
    } else {
      try {
        final result = await localDataSource.all();
        return Right(result.map((e) => e.toEntity).toList());
      } on CacheException {
        return Left(CachedFailure(message: "Data is not Present"));
      }
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> search(String query) async {
    try {
      final result = await remoteDataSource.search(query);
      return Right(result.map((e) => e.toEntity).toList());
    } on TimeoutException {
      return Left(TimeOutFailure(message: "Timeout"));
    } on ServerExcetion {
      return Left(ServerFailure(message: "Server Error"));
    } on NotFoundException {
      return Left(NotFoundFailure(message: "Not Found"));
    } on SocketException {
      return Left(CachedFailure(message: "Data is not Present"));
    }
  }

  @override
  Future<Either<Failure, List<DestinationEntity>>> top() async {
    try {
      final result = await remoteDataSource.top();
      return Right(result.map((e) => e.toEntity).toList());
    } on TimeoutException {
      return Left(TimeOutFailure(message: "Timeout"));
    } on ServerExcetion {
      return Left(ServerFailure(message: "Server Error"));
    } on NotFoundException {
      return Left(NotFoundFailure(message: "Not Found"));
    } on SocketException {
      return Left(CachedFailure(message: "Data is not Present"));
    }
  }
}
