import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/params/params.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/platform/network_info.dart';
import '../../domain/repositories/insert_product_repository.dart';
import '../datasource/remote_data_source.dart';

class InsertProductRepositoryImpl implements InsertProductRepository{

  final NetworkInfo networkInfo;
  final RemoteDataSource remoteDataSource;

  const InsertProductRepositoryImpl({
    required this.networkInfo,
    required this.remoteDataSource

  });

  @override
  Future<Either<Failure, Unit>> insertProduct({required InsertProductParams insertProductParams}) async{
    // TODO: implement insertProduct
    final connection = await networkInfo.isConnected;
    if (connection == true){
      try{
       final success = await remoteDataSource.insertProduct(insertProductParams);
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