import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/params/auth_params.dart';
import '../../data/data sources/remote_data_source.dart';
import '../../domain/entities/user_entity.dart';
import 'package:dartz/dartz.dart';

import '../../domain/repositories/login_repository.dart';
import '../data sources/local_data_source.dart';
import '../model/user_model.dart';

class LoginRepositoryImpl implements LoginRepository{
  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  LoginRepositoryImpl({required this.localDataSource, required this.networkInfo, required this.remoteDataSource});
  
  @override
  Future<Either<Failure, UserEntity>> login(LoginParams loginParams) async{
    // TODO: implement login
    final connection = await networkInfo.isConnected;
    if (connection){
      try{
          final token = await remoteDataSource.login(loginParams);
          print('......................................');
          print(token);
          //await localDataSource.storeToken(token);
          final userModel = await remoteDataSource.getMe(GetMeParams(token: token));
          print('**********************');
          print(userModel);
          await localDataSource.cacheUserInfo(userModel);
          final UserEntity  userEntity = userModel;
          return Right(userEntity);

      }on ServerException{
        return Left(ServerFailure());
      }on UnauthorizedException{
        return Left(Unauthorized());
      }

    }
    else{
      return Left(ConnectionFailure());
    }
    

  }

}