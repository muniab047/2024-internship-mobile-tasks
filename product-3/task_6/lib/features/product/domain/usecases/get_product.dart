import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/product_entity.dart';
import '../repositories/get_product_repository.dart';

class GetProduct{
  final GetProductRepository getProductRepository;

  GetProduct({required this.getProductRepository});

  Future<Either<Failure, ProductEntity>> call({
    required GetProductParams getProductParams
  })async{
    return await getProductRepository.getProduct(getProductParams:getProductParams);
  }

}