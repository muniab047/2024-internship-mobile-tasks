import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';

abstract class DeleteProductRepository {
  Future<Either<Failure, Unit>> deleteProduct({ 
    required DeleteProductParams deleteProductParams });
}