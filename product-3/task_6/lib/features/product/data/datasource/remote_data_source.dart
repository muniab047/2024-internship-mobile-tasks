import 'package:dartz/dartz.dart';

import '../../../../core/params/params.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

abstract class RemoteDataSource {
  Future<ProductModel> getProduct(GetProductParams getProductParams);
  Future <Unit> insertProduct(InsertProductParams insertProductParams);
  Future <Unit> updateProduct(UpdateProductParams updateProductParams);
  Future <Unit> deleteProduct(DeleteProductParams deleteProductParams);
  
  

}