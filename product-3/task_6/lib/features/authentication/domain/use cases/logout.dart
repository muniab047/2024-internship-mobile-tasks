import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../entities/user_entity.dart';
import '../repositories/logout_repository.dart';

class Logout {
  final LogoutRepository logoutRepository;

  Logout({required this.logoutRepository});

  Future<Unit> call(){
    return logoutRepository.logout();
  }

}