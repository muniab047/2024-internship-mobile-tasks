import '../../../../core/params/params.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future <ProductModel> getProduct(ProductParams params);
  Future <void> cacheProduct (ProductModel productToCache);


}