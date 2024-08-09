import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/get_product_repository.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_data_source.dart';

class GetProductRepositoryImpl implements GetProductRepository{
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  GetProductRepositoryImpl({required this.localDataSource, required this.remoteDataSource, required this.networkInfo});

  @override
  Future<Either<Failure, ProductEntity>> getProduct({required GetProductParams getProductParams}) async{

    final connection = await networkInfo.isConnected;

    if (connection == true){
      try{
        final productModel = await remoteDataSource.getProduct(getProductParams);
        await localDataSource.cacheProduct(productModel);
        ProductEntity productEntity = productModel;
        return Right(productEntity);
      } on ServerException{
        return Left(ServerFailure());

      }
    }

    else{
      try{
        ProductEntity productEntity = await localDataSource.getProduct(getProductParams);
        return Right(productEntity);
      }on CacheException{
        return Left(CacheFailure());
      }
    }

    
}}