import 'dart:convert';


import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';

import '../../../helpers/fixtures/fixture_reader.dart';   

void main(){
  const testProductModel = const ProductModel(
        image: 'assets/img/p4.jpg',
        item: 'dddsd',
        name: 'Durby leather shoes',
        price: 12.0,
        sizes: [23, 24, 25],
        id: 1,
      );
      
   Map <String, dynamic> testJson = json.decode(fixture('dummy_product_response'));

  test('should be subclass of product entity',
        () async {

          expect(testProductModel, isA<ProductEntity>());
        });

  group('from Json', (){
    test('should return a valid model', () async {
      

      final result = ProductModel.fromJson(testJson);

      expect(result, testProductModel);
    });

    test(
      'should return json', 
      ()async {
        final Map <String, dynamic> expected = testJson;
                                          
        expect(testProductModel.toJson(), expected);
                                          
                                           });

  });

  
}