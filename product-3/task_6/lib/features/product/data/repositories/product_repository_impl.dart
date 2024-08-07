import 'package:flutter/foundation.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/platform/network_info.dart';
import '../../domain/entities/product_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/product_repository.dart';
import '../datasource/local_data_source.dart';
import '../datasource/remote_data_source.dart';

class ProductRepositoryImpl implements ProductRepository{
  final LocalDataSource localDataSource;
  final RemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

const ProductRepositoryImpl({
  required this.localDataSource,
  required this.networkInfo,
  required this.remoteDataSource
});
  

  @override
  Future<Either<Failure, ProductEntity>> getProduct({required ProductParams productParams}) {
    // TODO: implement getProduct
    throw UnimplementedError();
  }


}