import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../entities/product_entity.dart';
import '../repositories/get_all_products_repository.dart';

class GetAllProducts {
  final GetAllProductsRepository getAllProductsRepository;

  const GetAllProducts({required this.getAllProductsRepository});

  Future<Either<Failure, List<ProductEntity>>> call() async{
    return await getAllProductsRepository.getAllProducts();
  }
}