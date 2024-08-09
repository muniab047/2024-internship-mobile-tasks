import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/product_entity.dart';
import '../repositories/update_product_repository.dart';

class UpdateProduct{
  final UpdateProductRepository updateProductRepository;

  UpdateProduct({required this.updateProductRepository});

  Future<Either<Failure, Unit>> call({
    required UpdateProductParams updateProductParams
  })async{
    return await updateProductRepository.updateProduct(updateProductParams: updateProductParams);
  }

}