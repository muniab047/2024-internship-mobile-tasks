import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repositories/get_product_repository_impl.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart';

import '../../../../helpers/test_helper.mocks.dart';

void main(){

  late GetProductRepository repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockLocalDataSource mockLocalDataSource;
  late MockRemoteDataSource mockRemoteDataSource;


  setUp((){

    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = GetProductRepositoryImpl(localDataSource: mockLocalDataSource, networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);

    
  });

  GetProductParams getProductParams =GetProductParams(id:' 1');
  ProductModel tproductModel = ProductModel(image: 'assets/img/p4.jpg',
        description: "Explore anime characters.",
        name: "Anime website",
        price: 12.0,
        id: "6672752cbd218790438efdb0",);
  ProductEntity tproductEntity = tproductModel;
  Failure tServerFailure = ServerFailure();
  Failure tCacheFailure = CacheFailure();



  group('if isConnected',(){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);

    });

    test('should check if the device is online', 
    ()async{
      when(mockRemoteDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
      when(mockLocalDataSource.cacheProduct(tproductModel)).thenAnswer((_)async => unit);
      await repository.getProduct(getProductParams: getProductParams);
      verify(mockNetworkInfo.isConnected);

    });

    group('get product', 
    (){

      test('should return product entity when it succeed', ()async{
        when(mockRemoteDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
        when(mockLocalDataSource.cacheProduct(tproductModel)).thenAnswer((_)async => unit);
        
        final result = await repository.getProduct(getProductParams: getProductParams);
        expect(result, Right(tproductEntity));

      });

      test('should cache', ()async{
        when(mockRemoteDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
        when(mockLocalDataSource.cacheProduct(tproductModel)).thenAnswer((_)async => unit);
        final result = await repository.getProduct(getProductParams: getProductParams);

        verify(mockRemoteDataSource.getProduct(getProductParams));
        verify(mockLocalDataSource.cacheProduct(tproductModel));
        
      });


      test ('should return failure when it fails',()async{
        when(mockRemoteDataSource.getProduct(getProductParams)).thenThrow(ServerException());
        final result = await repository.getProduct(getProductParams: getProductParams);
       
        expect(result, Left(tServerFailure));
         });


    });
  });


  group('not online', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async =>false);

    });

    test('if connection ofline', ()async{
      when(mockRemoteDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
      when(mockLocalDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
      await repository.getProduct(getProductParams: getProductParams);

      verifyZeroInteractions(mockRemoteDataSource);
      verify(mockNetworkInfo.isConnected);

    });

    test('should return product model local data source when connection if off', ()async{
      when(mockLocalDataSource.getProduct(getProductParams)).thenAnswer((_)async => tproductModel);
      final result = await repository.getProduct(getProductParams: getProductParams);
      expect(result, Right(tproductEntity));

    });

    test('should return cache failure ', ()async{
      when(mockLocalDataSource.getProduct(getProductParams)).thenThrow(CacheException());
      final result = await repository.getProduct(getProductParams: getProductParams);
      
      expect(result, Left(tCacheFailure));
    });



  });

}