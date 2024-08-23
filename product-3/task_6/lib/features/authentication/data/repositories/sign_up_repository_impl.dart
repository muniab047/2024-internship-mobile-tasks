import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/params/auth_params.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/sign_up_repository.dart';
import '../data sources/remote_data_source.dart';

class SignUpRepositoryImpl  implements SignUpRepository{
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;

  SignUpRepositoryImpl({required this.networkInfo, required this.remoteDataSource}); 
  
  @override
  Future<Either<Failure, Unit>> signUp(SignUpParams signUpParams) async{
    // TODO: implement signUp
    final connection = await networkInfo.isConnected;
    if (connection){
     try{
      final result = await remoteDataSource.signUp(signUpParams);
      return Right(result);     

      }on ServerException{
        return Left(ServerFailure());}

    }
    else{
      return Left(ConnectionFailure());
    }
    
  }
}