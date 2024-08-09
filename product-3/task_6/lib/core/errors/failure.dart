import 'package:equatable/equatable.dart';
abstract class Failure {}

class ServerFailure extends Failure{
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failure{}

class ConnectionFailure extends Failure{}