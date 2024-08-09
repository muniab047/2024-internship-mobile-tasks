import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';

import 'package:task_6/features/product/domain/usecases/get_product.dart';
import '../../../helpers/test_helper.mocks.dart';


void main(){
  late GetProduct getProduct;
  late MockGetProductRepository mockGetProductRepository;


  setUp((){
    mockGetProductRepository = MockGetProductRepository();
    getProduct = GetProduct(getProductRepository: mockGetProductRepository);

  
  });


 
 
}