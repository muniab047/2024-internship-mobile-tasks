import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

abstract class InsertProductRepository {

  Future<Either<Failure, Unit>> insertProduct({ 
    required InsertProductParams insertProductParams });
}