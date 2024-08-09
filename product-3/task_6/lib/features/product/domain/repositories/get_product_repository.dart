import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../entities/product_entity.dart';

abstract class GetProductRepository {
  Future<Either<Failure,ProductEntity>> getProduct({required GetProductParams getProductParams});
}