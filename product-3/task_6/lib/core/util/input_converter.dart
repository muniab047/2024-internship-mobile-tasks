import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../errors/failure.dart';

class InputConverter {
  Either<Failure, int>  stringToUnsignedInteger(String str){
    try{
      return Right(int.parse(str));
    }on FormatException{
      return Left(InvalidInputFailure());
    }
  }
}

class InvalidInputFailure extends Failure{}