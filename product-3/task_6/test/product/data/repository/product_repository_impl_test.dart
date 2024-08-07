import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/core/platform/network_info.dart';
import 'package:task_6/features/product/data/datasource/local_data_source.dart';
import 'package:task_6/features/product/data/datasource/remote_data_source.dart';
import 'package:task_6/features/product/data/models/product_model.dart';
import 'package:task_6/features/product/data/repositories/product_repository_impl.dart';


class MockRemoteDataSource extends Mock implements RemoteDataSource{
   @override
  Future<ProductModel> getProduct(ProductParams) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

}

class MockLocalDataSource extends Mock implements LocalDataSource{

  @override
  Future<ProductModel> getProduct(ProductParams params) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }

  @override
  Future<void> cacheProduct(ProductModel productToCache) {
    // TODO: implement cacheProduct
    throw UnimplementedError();
  }

  

}

class MockNetworkInfo extends Mock implements NetworkInfo{
  
}

void main(){
  ProductRepositoryImpl repository;
  MockLocalDataSource mockLocalDataSource;
  MockNetworkInfo mockNetworkInfo;
  MockRemoteDataSource mockRemoteDataSource;

  setUp((){

    mockRemoteDataSource = MockRemoteDataSource();
    mockLocalDataSource = MockLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    repository = ProductRepositoryImpl(localDataSource: mockLocalDataSource, networkInfo: mockNetworkInfo, remoteDataSource: mockRemoteDataSource);
  });
  


}