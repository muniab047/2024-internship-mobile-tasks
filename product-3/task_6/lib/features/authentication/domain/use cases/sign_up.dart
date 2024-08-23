import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/user_entity.dart';
import '../repositories/sign_up_repository.dart';

class SignUp {
  final SignUpRepository signUpRepository;

  SignUp({required this.signUpRepository});

  Future<Either<Failure, Unit>> call(SignUpParams signUpParams){
    return signUpRepository.signUp(signUpParams);
  }

}