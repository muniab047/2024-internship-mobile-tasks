import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/repositories/delete_product_repository_impl.dart';
import 'package:task_6/features/product/domain/usecases/insert_product.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  
  late DeleteProductRepositoryImpl deleteProductRepository;
  late MockNetworkInfo mockNetworkInfo;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    deleteProductRepository = DeleteProductRepositoryImpl(networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);
  });


  DeleteProductParams deleteProductParams = const DeleteProductParams(id: '1');
  Failure serverFailure = ServerFailure();
  Failure connectionFailure = ConnectionFailure();

  group('online', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);
    });

    test('check if online', ()async{
      when(mockRemoteDataSource.deleteProduct(deleteProductParams)).thenAnswer((_)async => unit);
      await deleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams);
      verify(mockNetworkInfo.isConnected);

    });

    test('delete prorduct when online', ()async{
        when(mockRemoteDataSource.deleteProduct(deleteProductParams)).thenAnswer((_)async => unit);
        final result = await deleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams);
        expect(result, Right(unit));
    });


    test('return failure when not seccced', ()async{
        when(mockRemoteDataSource.deleteProduct(deleteProductParams)).thenThrow(ServerException());
        final result = await deleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams);
        expect(result, Left(serverFailure));

    });

  });

  group('offline group', (){

    setUp((){
    when(mockNetworkInfo.isConnected).thenAnswer((_)async => false);

    });
  test('offline', ()async{
    final result = await deleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams);

    verifyZeroInteractions(mockRemoteDataSource);
    expect(result, Left(connectionFailure));

  });
  });



}