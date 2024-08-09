import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/delete_product_repository.dart';
import '../datasource/remote_data_source.dart';

class DeleteProductRepositoryImpl implements DeleteProductRepository{
  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;

  const DeleteProductRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource

  });
  
 

  @override
  Future<Either<Failure, Unit>> deleteProduct({required DeleteProductParams deleteProductParams}) async{
    //TODO: implement deleteProduct
    final connection = await networkInfo.isConnected;
    if (connection == true){
      try{
       final success = await remoteDataSource.deleteProduct(deleteProductParams);
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