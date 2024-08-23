import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/user_entity.dart';
import '../repositories/login_repository.dart';

class Login {
  final LoginRepository loginRepository;

  Login({required this.loginRepository});

  Future<Either<Failure, UserEntity>> call(LoginParams loginParams){
    return loginRepository.login(loginParams);
  }

}