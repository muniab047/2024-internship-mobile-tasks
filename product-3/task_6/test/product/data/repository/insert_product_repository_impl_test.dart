import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/repositories/delete_product_repository_impl.dart';
import 'package:task_6/features/product/data/repositories/insert_product_repository_impl.dart';
import 'package:task_6/features/product/domain/usecases/insert_product.dart';

import '../../../helpers/test_helper.mocks.dart';

void main(){
  
  late InsertProductRepositoryImpl insertProductRepository;
  late MockNetworkInfo mockNetworkInfo;
  late MockRemoteDataSource mockRemoteDataSource;

  setUp((){
    mockRemoteDataSource = MockRemoteDataSource();
    mockNetworkInfo = MockNetworkInfo();
    insertProductRepository = InsertProductRepositoryImpl(networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);
  });


  InsertProductParams insertProductParams = const InsertProductParams(image: 'assets/img/p4.jpg',
        item: 'dddsd',
        name: 'Durby leather shoes',
        price: 12.0,
        sizes: [23, 24, 25],
        id: 1,);
  Failure serverFailure = ServerFailure();
  Failure connectionFailure = ConnectionFailure();

  group('online', (){
    setUp((){
      when(mockNetworkInfo.isConnected).thenAnswer((_)async => true);
    });

    test('check if online', ()async{
      when(mockRemoteDataSource.insertProduct(insertProductParams)).thenAnswer((_)async => unit);
      await insertProductRepository.insertProduct(insertProductParams: insertProductParams);
      verify(mockNetworkInfo.isConnected);

    });

    test('delete prorduct when online', ()async{
        when(mockRemoteDataSource.insertProduct(insertProductParams)).thenAnswer((_)async => unit);
        final result = await insertProductRepository.insertProduct(insertProductParams: insertProductParams);
        expect(result, Right(unit));
    });


    test('return failure when not seccced', ()async{
        when(mockRemoteDataSource.insertProduct(insertProductParams)).thenThrow(ServerException());
        final result = await insertProductRepository.insertProduct(insertProductParams: insertProductParams);
        expect(result, Left(serverFailure));

    });

  });

  group('offline group', (){

    setUp((){
    when(mockNetworkInfo.isConnected).thenAnswer((_)async => false);

    });
  test('offline', ()async{
    final result = await insertProductRepository.insertProduct(insertProductParams: insertProductParams);

    verifyZeroInteractions(mockRemoteDataSource);
    expect(result, Left(connectionFailure));

  });
  });

}