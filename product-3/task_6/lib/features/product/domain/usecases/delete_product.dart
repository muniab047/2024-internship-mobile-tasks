import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../entities/product_entity.dart';
import '../repositories/delete_product_repository.dart';


class DeleteProduct{
  final DeleteProductRepository deleteProductRepository;

  DeleteProduct ({required this.deleteProductRepository});

  Future<Either<Failure, Unit>> call({required DeleteProductParams deleteProductParams})async{

    return await deleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams);
    }

}