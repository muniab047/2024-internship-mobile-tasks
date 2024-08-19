import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repositories/get_all_products_repository_impl.dart';
import 'package:task_6/features/product/data/repositories/get_product_repository_impl.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/repositories/get_all_products_repository.dart';
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart';
import 'package:collection/collection.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){

  late GetAllProductsRepository repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;


  setUp((){

    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GetAllProductsRepositoryImpl(localDataSource: mockLocalDataSource, networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);

    
  });

  List<ProductModel> tProductModelList = [
    ProductModel(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",),
    ProductModel(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",),
    ProductModel(image: 'assets/img/p4.jpg',description: "Explore anime characters.",name: "Anime website", price: 12.0,id: "6672752cbd218790438efdb0",)];

  List<ProductEntity> tProductEntityList = tProductModelList.map((productModel) => productModel.toEntity()).toList();
  Failure tServerFailure = ServerFailure();
  Failure tCacheFailure = CacheFailure();



  group('if isConnected',(){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);

    });

    test('should check if the device is online', 
    ()async{
      when(mockRemoteDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
      when(mockLocalDataSource.cacheAllProducts(tProductModelList)).thenAnswer((_)async => unit);
      await repository.getAllProducts();
      verify(mockNetworkInfo.isConnected);

    });

    group('get product', 
    (){

      test('should return product entity when it succeed', ()async{
        when(mockRemoteDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
        when(mockLocalDataSource.cacheAllProducts(tProductModelList)).thenAnswer((_)async => unit);
        
        final result = await repository.getAllProducts();
        final listEquality = ListEquality<ProductEntity>();
        expect(listEquality.equals(result.getOrElse(() => []), tProductEntityList), isTrue);

      });

      test('should cache', ()async{
        when(mockRemoteDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
        when(mockLocalDataSource.cacheAllProducts(tProductModelList)).thenAnswer((_)async => unit);
        await repository.getAllProducts();

        verify(mockRemoteDataSource.getAllProducts());
        verify(mockLocalDataSource.cacheAllProducts(tProductModelList));
        
      });


      test ('should return failure when it fails',()async{
        when(mockRemoteDataSource.getAllProducts()).thenThrow(ServerException());
        final result = await repository.getAllProducts();
       
        expect(result, Left(tServerFailure));
         });


    });
  });


  group('not online', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async =>false);

    });

    test('if connection ofline', ()async{
      when(mockRemoteDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
      when(mockLocalDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
      await repository.getAllProducts();

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockNetworkInfo.isConnected);

    });

    test('should return product model local data source when connection if off', ()async{
      when(mockLocalDataSource.getAllProducts()).thenAnswer((_)async => tProductModelList);
      final result = await repository.getAllProducts();
      final listEquality = ListEquality();

      expect(listEquality.equals(result.getOrElse(()=>[]), tProductEntityList), isTrue);

    });

    test('should return cache failure ', ()async{
      when(mockLocalDataSource.getAllProducts()).thenThrow(CacheException());
      final result = await repository.getAllProducts();
      
      expect(result, Left(tCacheFailure));
    });



  });

}