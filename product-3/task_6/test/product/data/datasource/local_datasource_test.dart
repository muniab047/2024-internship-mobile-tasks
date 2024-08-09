import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/datasource/local_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

import '../../../helpers/fixtures/fixture_reader.dart';
import '../../../helpers/test_helper.mocks.dart';

void main(){
  late LocalDataSourceImpl localDataSource;
  late MockSharedPreferences mockSharedPreferences;

  setUp((){
    mockSharedPreferences = MockSharedPreferences();
    localDataSource = LocalDataSourceImpl(sharedPreferences: mockSharedPreferences);

  });

  group('getProduct', (){
    final tProductModel = const ProductModel(image: 'assets/img/p4.jpg',
        item: 'dddsd',
        name: 'Durby leather shoes',
        price: 12.0,
        sizes: [23, 24, 25],
        id: 1);
    final GetProductParams getProductParams = GetProductParams(id: 1);

    test('should return product model when there is one in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(fixture('dummy_product_response'));
      final result = await localDataSource.getProduct(getProductParams);

      verify(mockSharedPreferences.getString('CACHED_PRODUCT'));
      expect(result, tProductModel);
    });

     test('should throw a cacheException when there is null in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = localDataSource.getProduct;


      expect(() => call(getProductParams), throwsA(isA<CacheException>()));
    });


  });


  group('cacheProduct', (){
    final tProductModel = const ProductModel(image: 'assets/img/p4.jpg',
        item: 'dddsd',
        name: 'Durby leather shoes',
        price: 12.0,
        sizes: [23, 24, 25],
        id: 1);

    test('should cache product model', ()async{
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);
      final result = await localDataSource.cacheProduct(tProductModel);
      final expectedJsonString = json.encode(tProductModel.toJson());

      verify(mockSharedPreferences.setString('CACHED_PRODUCT', expectedJsonString));
      expect(result, unit);
    });

  });
  
}