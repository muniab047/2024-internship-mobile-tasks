import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';

import 'package:task_6/features/product/domain/usecases/get_product.dart';
import '../../../../helpers/test_helper.mocks.dart';


void main(){
  late GetAllProducts getAllProducts;
  late MockGetAllProductsRepository mockGetAllProductsRepository;


  setUp((){
    mockGetAllProductsRepository = MockGetAllProductsRepository();
    getAllProducts = GetAllProducts(getAllProductsRepository: mockGetAllProductsRepository);

  
  });
  List<ProductEntity> productEntityList = [
    ProductEntity(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",),
    ProductEntity(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",),
    ProductEntity(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",)];

  test('should return list of product entity when it succeed', ()async{
    when(mockGetAllProductsRepository.getAllProducts()).thenAnswer((_)async => Right(productEntityList));
    final result = await getAllProducts.call();
    expect(result,  Right(productEntityList));
  });


  test('should return Failure entity when it fails', ()async{
    when(mockGetAllProductsRepository.getAllProducts()).thenAnswer((_)async => Left(ServerFailure()));
    final result = await getAllProducts.call();
    expect(result,  Left(ServerFailure()));
  });
 
}