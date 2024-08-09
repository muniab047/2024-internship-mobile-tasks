import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

abstract class UpdateProductRepository {
  Future<Either<Failure, Unit>> updateProduct({ 
    required UpdateProductParams updateProductParams });
}