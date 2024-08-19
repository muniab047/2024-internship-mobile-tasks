import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/repositories/delete_product_repository_impl.dart';
import 'package:task_6/features/product/data/repositories/insert_product_repository_impl.dart';
import 'package:task_6/features/product/data/repositories/update_product_repository_impl.dart';
import 'package:task_6/features/product/domain/usecases/insert_product.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  
  late UpdateProductRepositoryImpl updateProductRepository;
  late MockNetworkInfo mockNetworkInfo;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    updateProductRepository = UpdateProductRepositoryImpl(networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);
  });


  UpdateProductParams updateProductParams = const UpdateProductParams(
        description: "Explore anime characters.",
        name: "Anime website",
        price: 12.0,
        id: "6672752cbd218790438efdb0",);
  Failure serverFailure = ServerFailure();
  Failure connectionFailure = ConnectionFailure();

  group('online', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);
    });

    test('check if online', ()async{
      when(mockRemoteDataSource.updateProduct(updateProductParams)).thenAnswer((_)async => unit);
      await updateProductRepository.updateProduct(updateProductParams: updateProductParams);
      verify(mockNetworkInfo.isConnected);

    });

    test('delete prorduct when online', ()async{
        when(mockRemoteDataSource.updateProduct(updateProductParams)).thenAnswer((_)async => unit);
        final result = await updateProductRepository.updateProduct(updateProductParams: updateProductParams);
        expect(result, Right(unit));
    });


    test('return failure when not seccced', ()async{
        when(mockRemoteDataSource.updateProduct(updateProductParams)).thenThrow(ServerException());
        final result = await updateProductRepository.updateProduct(updateProductParams: updateProductParams);
        expect(result, Left(serverFailure));

    });

  });

  group('offline group', (){

    setUp((){
    when(mockNetworkInfo.isConnected).thenAnswer((_)async => false);

    });
  test('offline', ()async{
    final result = await updateProductRepository.updateProduct(updateProductParams: updateProductParams);

    verifyZeroInteractions(mockRemoteDataSource);
    expect(result, Left(connectionFailure));

  });
  });



}