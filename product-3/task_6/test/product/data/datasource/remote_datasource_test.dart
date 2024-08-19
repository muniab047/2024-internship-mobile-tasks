import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/data/datasource/remote_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';

import '../../../helpers/fixtures/fixture_reader.dart';
import '../../../helpers/test_helper.mocks.dart';
import 'package:http/http.dart' as http;



void main(){
  late RemoteDataSourceImpl remoteDataSourceImpl;
  late MockClient mockClient;
  late GetProductParams getProductParams;
  late MockMultipartRequest mockMultipartRequest;


  setUp((){
    mockClient = MockClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client : mockClient);
    mockMultipartRequest = MockMultipartRequest();
    

  });
  

  group('get product', () {
    getProductParams = GetProductParams(id: '1');

    test('should perform a get request on url with parameter being the end point and with application/json header', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response(fixture('dummy_product_response'), 200));
      remoteDataSourceImpl.getProduct(getProductParams);
      verify(mockClient.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${getProductParams.id}'), headers: {'Content-Type': 'application/json'}));
    });

    test('should return ProductModel when the response code is 200', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response(fixture('dummy_product_response'), 200));
      final result = await remoteDataSourceImpl.getProduct(getProductParams);
      expect(result, isA<ProductModel>());
      expect(result, ProductModel.fromJson(json.decode(fixture('dummy_product_response'))['data']));
    });

    test('should throw a Server Exception when the response code is 404 or other', () async {
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('Something went wrong', 404));
      final call = await remoteDataSourceImpl.getProduct;

      expect(() => call(getProductParams), throwsA(isA<ServerException>()));
    });
  });

    group('insert product', () {
      final insertProductParams = InsertProductParams(
                                      image: XFile('C:\\Users\\trt\\Pictures\\1b70f5fb14bc1f6bd9fac8e76629219a.jpg'),
                                      description: "Explore anime characters.",
                                      name: "Anime website",
                                      price: '123.0',
);


      test('should perform a post request to the end point', ()async {
      when(mockClient.send(any)).thenAnswer((_)async=> http.StreamedResponse(Stream.empty(), 201));
      await remoteDataSourceImpl.insertProduct(insertProductParams);

      verify(mockClient.send(any));

      });

      test('should return success when it is added successfully', () async {
      when(mockClient.send(any)).thenAnswer((_)async=> http.StreamedResponse(Stream.empty(), 201));
      final result = await remoteDataSourceImpl.insertProduct(insertProductParams);
      verify(mockClient.send(any));
      expect(result, unit);
      });

      test('should return ServerException if the status code is 404 or other', () async {
 
       when(mockClient.send(any)).thenAnswer((_)async=> http.StreamedResponse(Stream.empty(), 404));
      final call = await remoteDataSourceImpl.insertProduct;
      expect(() => call(insertProductParams), throwsA(isA<ServerException>()));
      });
    });



    group('update product', () {
      final updateProductParams = const UpdateProductParams(
      description: "Explore anime characters.",
      name: "Anime website",
      price: 123.0,
      id: "6672752cbd218790438efdb0",
      );

      test('should perform a put request to the end point', () async {
      final jsonString = json.encode(updateProductParams.toJson());

      when(mockClient.put(any, body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('', 200));

      await remoteDataSourceImpl.updateProduct(updateProductParams);

      verify(mockClient.put(
        Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${updateProductParams.id}'),
        headers: {'Content-Type': 'application/json'},
        body: jsonString,
      ));
      });

      test('should return success when it is updated successfully', () async {
      when(mockClient.put(any, body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('', 200));

      final post = await remoteDataSourceImpl.updateProduct(updateProductParams);

      expect(post, unit);
      });

      test('should return ServerException if the put method response status code is 404 or other', () async {
      when(mockClient.put(any, body: anyNamed('body'), headers: anyNamed('headers')))
        .thenAnswer((_) async => http.Response('something wrong', 400));

      final call = await remoteDataSourceImpl.updateProduct;

      expect(() => call(updateProductParams), throwsA(isA<ServerException>()));
      });
    });



    group('delete product', () {
      final deleteProductParams = const DeleteProductParams(id: "6672752cbd218790438efdb0");

      test('should perform a post request to the end point', () async {
        when(mockClient.delete(any, body: anyNamed('body'), headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('', 200));
        await remoteDataSourceImpl.deleteProduct(deleteProductParams);
        verify(mockClient.delete(
          Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${deleteProductParams.id}'),
          headers: {'Content-Type': 'application/json'},
          body: anyNamed('body'),
        ));
      });

      test('should return success when it is added successfully', () async {
        when(mockClient.delete(any, body: anyNamed('body'), headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('', 200));
        final post = await remoteDataSourceImpl.deleteProduct(deleteProductParams);

        expect(post, unit);
      });

      test('should return ServerException if the status code is 404 or other', () async {
        when(mockClient.delete(any, body: anyNamed('body'), headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('something wrong', 400));
        final call = await remoteDataSourceImpl.deleteProduct;

        expect(() => call(deleteProductParams), throwsA(isA<ServerException>()));
      });
    });


    group('get all products', () {
      const List<ProductModel> tProductModelList = [
        const ProductModel(
          id: '6672752cbd218790438efdb0',
          name: 'Anime website',
          description: 'Explore anime characters.',
          price: 123.0,
          image:
              'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        ),
        const ProductModel(
          id: '667275bab905525c145fe08f',
          name: 'Anime website',
          description: 'Explore anime characters.',
          price: 123.0,
          image:
              'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777275/images/t7j2mqmcukrogvvausqj.jpg',
        ),
        const ProductModel(
          id: '667275d7b905525c145fe093',
          name: 'Anime website',
          description: 'Explore anime characters.',
          price: 123.0,
          image:
              'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777304/images/lmngzkii9zfo17ohxa6n.jpg',
        ),
      ];

      test('should perform a get request on end point and with application/json header', () async {
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => await http.Response(fixture('dummy_all_products_response'), 200));
        remoteDataSourceImpl.getAllProducts();
        verify(mockClient.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),
            headers: {'Content-Type': 'application/json'}));
      });

      test('should return ProductModel list when the response code is 200', () async {
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response(fixture('dummy_all_products_response'), 200));
        final result = await remoteDataSourceImpl.getAllProducts();
        expect(result, isA<List<ProductModel>>());
        expect(result, tProductModelList);
      });

      test('should throw a Server Exception when the response code is 404 or other', () async {
        when(mockClient.get(any, headers: anyNamed('headers')))
            .thenAnswer((_) async => http.Response('Something went wrong', 404));
        final call = await remoteDataSourceImpl.getAllProducts;
        expect(() => call(), throwsA(isA<ServerException>()));
      });
    });



  }