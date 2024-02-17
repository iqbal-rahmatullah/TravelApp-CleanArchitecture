// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;

  Failure({required this.message});

  @override
  List<Object> get props => [message];
}

class ServerFailure extends Failure {
  ServerFailure({required String message}) : super(message: message);
}

class ConnectionFailure extends Failure {
  ConnectionFailure({required String message}) : super(message: message);
}

class TimeOutFailure extends Failure {
  TimeOutFailure({required String message}) : super(message: message);
}

class CachedFailure extends Failure {
  CachedFailure({required String message}) : super(message: message);
}

class NotFoundFailure extends Failure {
  NotFoundFailure({required String message}) : super(message: message);
}
