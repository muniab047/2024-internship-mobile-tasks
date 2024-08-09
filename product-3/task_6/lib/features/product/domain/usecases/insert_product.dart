import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/params/params.dart';
import '../repositories/insert_product_repository.dart';

class InsertProduct{
  final InsertProductRepository insertProductRepository;

  InsertProduct({required this.insertProductRepository});

  Future<Either<Failure, Unit>> call({
    required InsertProductParams insertProductParams
  })async{
    return await insertProductRepository.insertProduct(insertProductParams: insertProductParams);
  }

}