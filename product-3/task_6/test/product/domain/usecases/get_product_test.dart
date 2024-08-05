import 'package:flutter_test/flutter_test.dart';

import 'package:task_6/features/product/domain/usecases/get_product.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  GetProduct getProduct;
  MockProductRepository mockProductRepository;


  setUp((){
    mockProductRepository = MockProductRepository();
    getProduct = GetProduct(productRepository: mockProductRepository);
  });
  
}