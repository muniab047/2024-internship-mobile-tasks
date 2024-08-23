import '../../../../core/errors/exception.dart';
import '../../../../core/errors/failure.dart';
import 'package:dartz/dartz.dart';

import '../../../../core/network/network_info.dart';
import '../../data/data sources/remote_data_source.dart';
import '../../domain/repositories/logout_repository.dart';
import '../data sources/local_data_source.dart';

class LogoutRepositoryImpl implements LogoutRepository{

  final NetworkInfo networkInfo;
  final AuthRemoteDataSource remoteDataSource;
  final AuthLocalDataSource localDataSource;

  LogoutRepositoryImpl({required this.localDataSource, required this.networkInfo, required this.remoteDataSource});
  
  
  @override
  Future<Unit> logout() async {
    // TODO: implement logout
     await localDataSource.clearToken();
     return unit;
  }
}