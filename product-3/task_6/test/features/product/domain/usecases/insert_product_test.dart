import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';

import 'package:task_6/features/product/domain/usecases/get_product.dart';
import 'package:task_6/features/product/domain/usecases/insert_product.dart';
import '../../../../helpers/test_helper.mocks.dart';


void main(){
  late InsertProduct insertProduct;
  late MockInsertProductRepository mockInsertProductRepository;


  setUp((){
    mockInsertProductRepository = MockInsertProductRepository();
    insertProduct = InsertProduct(insertProductRepository: mockInsertProductRepository);

  
  });
  InsertProductParams insertProductParams = InsertProductParams(
    image: XFile('C:\\Users\\trt\\Pictures\\1b70f5fb14bc1f6bd9fac8e76629219a.jpg'),
        description: "Explore anime characters.",
        name: "Anime website",
        price: '12.0',
        );
 

  test('should return unit entity when it succeed', ()async{
    when(mockInsertProductRepository.insertProduct(insertProductParams: insertProductParams)).thenAnswer((_)async => Right(unit));
    final result = await insertProduct.call(insertProductParams: insertProductParams);
    expect(result,  Right(unit));
  });


  test('should return Failure entity when it fails', ()async{
    when(mockInsertProductRepository.insertProduct(insertProductParams: insertProductParams)).thenAnswer((_)async => Left(ServerFailure()));
    final result = await insertProduct.call(insertProductParams: insertProductParams);
    expect(result,  Left(ServerFailure()));
  });
 
}