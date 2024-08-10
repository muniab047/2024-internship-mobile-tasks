import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
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


  setUp((){
    mockClient = MockClient();
    remoteDataSourceImpl = RemoteDataSourceImpl(client : mockClient);
    

  });
  

  group('get product', (){
    getProductParams = GetProductParams(id: '1');

    test('should perform a get request on url with parameter being the end point and with application/json header', ()async{
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_)async => http.Response(fixture('dummy_product_response'), 200));
    remoteDataSourceImpl.getProduct(getProductParams);
    verify(mockClient.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${getProductParams.id}'),headers: {'Content-Type': 'application/json'}));
    

    });
    
    test('should return ProductModel when the response code is 200', ()async{
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_)async => http.Response(fixture('dummy_product_response'), 200));
      final result = await remoteDataSourceImpl.getProduct(getProductParams);
      expect(result, isA<ProductModel>());
      expect(result, ProductModel.fromJson(json.decode(fixture('dummy_product_response'))));
    
    });

    test('should throw a Server Exception whaen the respose code is 404 or other', ()async{
      when(mockClient.get(any, headers: anyNamed('headers'))).thenAnswer((_) async => http.Response('Something went wrong', 404));
      final call = await remoteDataSourceImpl.getProduct;

      expect(()=>call(getProductParams), throwsA(isA<ServerException>()));
    });});


    group('insert product', (){
      InsertProductParams insertProductParams = const InsertProductParams( image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        description: "Explore anime characters.",
        name: "Anime website",
        price: 123.0,
        id: "6672752cbd218790438efdb0",);
      
       test('should perform a post request  end point', ()async{
          when(mockClient.post(any,body: anyNamed('body') , headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
          await remoteDataSourceImpl.insertProduct(insertProductParams);
          verify(mockClient.post(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'),headers: {'Content-Type': 'application/json'}, body: anyNamed('body')));
          });

      
      test('should return success when it added successfull', ()async{
        when(mockClient.post(any , body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
        final post = await remoteDataSourceImpl.insertProduct(insertProductParams);

        expect(post, unit);

      });

       test('should retun serverException is status code is 404 or other else', ()async{
        when(mockClient.post(any , body:anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('something wrong', 400));
        final call = await remoteDataSourceImpl.insertProduct;

        expect(() => call(insertProductParams), throwsA(isA<ServerException>()));

      });
    });



    group('update product', (){
      UpdateProductParams updateProductParams = const UpdateProductParams( image: 'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
        description: "Explore anime characters.",
        name: "Anime website",
        price: 123.0,
        id: "6672752cbd218790438efdb0",);
      
       test('should perform a put request  end point', ()async{
          when(mockClient.put(any,body: anyNamed('body') , headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
          final jsonString = json.encode(ProductModel(
                  image: updateProductParams.image, 
                  description: updateProductParams.description, 
                  name: updateProductParams.name, 
                  price: updateProductParams.price, 
                  id: updateProductParams.id).toJson());

          await remoteDataSourceImpl.updateProduct(updateProductParams);
          verify(mockClient.put(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${updateProductParams.id}'),headers: {'Content-Type': 'application/json'}, body: jsonString));
          });

      
      test('should return success when it updated successfully', ()async{
        when(mockClient.put(any , body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
        final post = await remoteDataSourceImpl.updateProduct(updateProductParams);

        expect(post, unit);

      });

       test('should retun serverException when put method response is status code is 404 or other else', ()async{
        when(mockClient.put(any , body:anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('something wrong', 400));
        final call = await remoteDataSourceImpl.updateProduct;

        expect(() => call(updateProductParams), throwsA(isA<ServerException>()));

      });
    });



     group('delete product', (){
      DeleteProductParams deleteProductParams = const DeleteProductParams( id: "6672752cbd218790438efdb0");
      
       test('should perform a post request  end point', ()async{
          when(mockClient.delete(any,body: anyNamed('body') , headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
          await remoteDataSourceImpl.deleteProduct(deleteProductParams);
          verify(mockClient.delete(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${deleteProductParams.id}'),headers: {'Content-Type': 'application/json'}, body: anyNamed('body')));
          });

      
      test('should return success when it added successfull', ()async{
        when(mockClient.delete(any , body: anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('', 200));
        final post = await remoteDataSourceImpl.deleteProduct(deleteProductParams);

        expect(post, unit);

      });

       test('should retun serverException is status code is 404 or other else', ()async{
        when(mockClient.delete(any , body:anyNamed('body'), headers: anyNamed('headers'))).thenAnswer((_)async => http.Response('something wrong', 400));
        final call = await remoteDataSourceImpl.deleteProduct;

        expect(() => call(deleteProductParams), throwsA(isA<ServerException>()));

      });
    });



  }