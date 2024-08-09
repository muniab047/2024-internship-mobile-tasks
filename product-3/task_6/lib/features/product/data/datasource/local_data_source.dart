import '../../../../core/params/params.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future <ProductModel> getProduct(GetProductParams getProductParams);
 

}