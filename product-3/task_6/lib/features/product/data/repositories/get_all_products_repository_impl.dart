import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/get_all_products_repository.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_data_source.dart';

class GetAllProductsRepositoryImpl implements GetAllProductsRepository{
  final NetworkInfo networkInfo;
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;

  GetAllProductsRepositoryImpl({required this.networkInfo, required this.localDataSource, required this.remoteDataSource});

  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts()async {
    // TODO: implement getAllproduct
    if (await networkInfo.isConnected){

      try{

      final allProductModels = await remoteDataSource.getAllProducts();
      localDataSource.cacheAllProducts(allProductModels);
      final allProductEntities = allProductModels.map((product) => product as ProductEntity).toList();
      return(Right(allProductEntities));
      }on ServerException{
        return Left(ServerFailure());
      }

    }else{

       try{

      final allProductModels = await localDataSource.getAllProducts();
      final allProductEntities = allProductModels.map((product) => product as ProductEntity).toList();
      return(Right(allProductEntities));
      }on CacheException{
        return Left(CacheFailure());
      }}
  }

}