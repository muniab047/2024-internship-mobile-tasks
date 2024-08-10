import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';

import 'package:task_6/features/product/domain/usecases/get_product.dart';
import '../../../helpers/test_helper.mocks.dart';


void main(){
  late DeleteProduct deleteProduct;
  late MockDeleteProductRepository mockDeleteProductRepository;


  setUp((){
    mockDeleteProductRepository = MockDeleteProductRepository();
    deleteProduct = DeleteProduct(deleteProductRepository: mockDeleteProductRepository);

  
  });
  DeleteProductParams deleteProductParams = DeleteProductParams(id: '1');
  

  test('should return product entity when it succeed', ()async{
    when(mockDeleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams)).thenAnswer((_)async => Right(unit));
    final result = await deleteProduct.call(deleteProductParams: deleteProductParams);
    expect(result,  Right(unit));
  });


  test('should return Failure entity when it fails', ()async{
    when(mockDeleteProductRepository.deleteProduct(deleteProductParams: deleteProductParams)).thenAnswer((_)async => Left(ServerFailure()));
    final result = await deleteProduct.call(deleteProductParams: deleteProductParams);
    expect(result,  Left(ServerFailure()));
  });
 
}