import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/failure.dart';
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
  GetProductParams getProductParams = GetProductParams(id: '1');
  ProductEntity productEntity = const ProductEntity(image: 'assets/img/p4.jpg',
        description: "Explore anime characters.",
        name: "Anime website",
        price: 12.0,
        id: "6672752cbd218790438efdb0",);

  test('should return product entity when it succeed', ()async{
    when(mockGetProductRepository.getProduct(getProductParams: getProductParams)).thenAnswer((_)async => Right(productEntity));
    final result = await getProduct.call(getProductParams: getProductParams);
    expect(result,  Right(productEntity));
  });


  test('should return Failure entity when it fails', ()async{
    when(mockGetProductRepository.getProduct(getProductParams: getProductParams)).thenAnswer((_)async => Left(ServerFailure()));
    final result = await getProduct.call(getProductParams: getProductParams);
    expect(result,  Left(ServerFailure()));
  });
 
}