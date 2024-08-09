import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/repositories/update_product_repository.dart';
import '../datasource/remote_data_source.dart';

class UpdateProductRepositoryImpl implements UpdateProductRepository{
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;

  const UpdateProductRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource

  });

  @override
  Future<Either<Failure, Unit>> updateProduct({required UpdateProductParams updateProductParams}) async{
    // TODO: implement updateProduct
    final connection = await networkInfo.isConnected;
    if (connection == true){
      try{
       final success = await remoteDataSource.updateProduct(updateProductParams);
       return Right(success);

      } on ServerException{
        return Left(ServerFailure());

      }
    }

    else{
      return Left(ConnectionFailure());
    }
  }
}