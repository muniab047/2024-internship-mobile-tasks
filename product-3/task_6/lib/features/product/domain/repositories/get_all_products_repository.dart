import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';

abstract class GetAllProductsRepository {

  Future<Either<Failure, List<ProductEntity>>> getAllproduct();

}