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

  final dummy_local_responce = 

  group('LocalDataSourceImpl - getProduct', (){
    final tProductModel = const ProductModel(image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        description: "Explore anime characters.",
        name: "Anime website",
        price: 123.0,
        id: "6672752cbd218790438efdb0",);

  final GetProductParams getProductParams = GetProductParams(id: '6672752cbd218790438efdb0');

   final shared_preferences_json_response = '{"id": "6672752cbd218790438efdb0","name": "Anime website","description": "Explore anime characters.","price": 123,"imageUrl": "https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg"}';

    test('should return product model when there is one in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(shared_preferences_json_response);
      final result = await localDataSource.getProduct(getProductParams);

      verify(mockSharedPreferences.getString("6672752cbd218790438efdb0"));
      expect(result, tProductModel);
    });

     test('should throw a cacheException when there is null in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = localDataSource.getProduct;


      expect(() => call(getProductParams), throwsA(isA<CacheException>()));
    });


  });


  group('LocalDataSourceImpl - cacheProduct', (){
    final tProductModel = const ProductModel(image: 'assets/img/p4.jpg',
        description: 'dddsd',
        name: 'Durby leather shoes',
        price: 12.0,
        id: '1');

    test('should cache product model', ()async{
      when(mockSharedPreferences.setString(any, any)).thenAnswer((_) async => true);
      final result = await localDataSource.cacheProduct(tProductModel);
      final expectedJsonString = json.encode(tProductModel.toJson());

      verify(mockSharedPreferences.setString('1', expectedJsonString));
      expect(result, unit);
    });

  });

  group('LocalDataSourceImpl - getAllProducts', (){
   List<ProductModel> tProductModelList = [
    const ProductModel( id: '6672752cbd218790438efdb0',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123.0,
        image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg'),
    const ProductModel( id: '667275bab905525c145fe08f',
        name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123.0,
        image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777275/images/t7j2mqmcukrogvvausqj.jpg'),
    const ProductModel( id: '667275d7b905525c145fe093',
       name: 'Anime website',
        description: 'Explore anime characters.',
        price: 123.0,
        image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777304/images/lmngzkii9zfo17ohxa6n.jpg')];


    test('should return product model list when there is one in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(fixture('dummy_all_products_response'));
      final result = await localDataSource.getAllProducts();

      verify(mockSharedPreferences.getString('CACHED_ALL_PRODUCTS'));
      expect(result, tProductModelList);
    });

     test('should throw a cacheException when there is null in cache', ()async{
      when(mockSharedPreferences.getString(any)).thenReturn(null);
      final call = localDataSource.getAllProducts;


      expect(() => call(), throwsA(isA<CacheException>()));
    });


  });
}
