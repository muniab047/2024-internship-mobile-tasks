import '../../../../core/params/params.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';

abstract class RemoteDataSource {
  Future<ProductModel> getProduct(ProductParams);

}