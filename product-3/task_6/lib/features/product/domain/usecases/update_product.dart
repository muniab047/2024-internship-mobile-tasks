import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/product_entity.dart';
import '../repositories/product_repository.dart';

class UpdateProduct{
  final ProductRepository productRepository;

  UpdateProduct({required this.productRepository});

  Future<Either<Failure, ProductEntity>> call({
    required ProductParams productParams
  })async{
    return await productRepository.getProduct(productParams: productParams);
  }

}