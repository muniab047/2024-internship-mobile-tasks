import 'package:dartz/dartz.dart';
import 'package:http/http.dart';
import 'dart:convert';

import '../../../../core/errors/exception.dart';
import '../../../../core/params/auth_params.dart';
import '../../../product/domain/entities/product_entity.dart';
import '../model/user_model.dart';

abstract class AuthRemoteDataSource {
  Future<String> login(LoginParams loginParams);
  Future<Unit>signUp(SignUpParams signUpParams);
  Future<UserModel> getMe(GetMeParams getMeParams);
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource{
  final Client client;

  AuthRemoteDataSourceImpl({required this.client});

  @override
  Future<String> login(LoginParams loginParams)async {  
    // TODO: implement login
    final url = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login');
    final headers = {'Content-Type' : 'application/json' };

    final body = json.encode(loginParams.toJson());
    
    final response = await client.post(url,body: body, headers: headers);
    print(response.body);
    if (response.statusCode == 201){
      
      final token = json.decode(response.body)['data']['access_token'];
      return token;

    }else if (response.statusCode == 401){
      throw UnauthorizedException();
    }
    else{
      throw ServerException();
    }
 

    
  }


  @override
  Future<Unit> signUp(SignUpParams signUpParams) async{
    // TODO: implement signUp
    //print('.................');
    final url = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register');
    final headers = {'Content-Type' : 'application/json' };

    final body = json.encode(signUpParams.toJson());
    final response = await client.post(url,body: body, headers: headers);
    print(response.body);
    if (response.statusCode == 201){
      return unit;
    }
    else{
      throw ServerException();
    }
  }
  
  @override
  Future<UserModel> getMe(GetMeParams getMeParams) async {
  final url = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me');
  
  // Corrected Headers
  final headers = {
    'Content-Type': 'application/json',
    'Authorization': 'Bearer ${getMeParams.token}',
  };

  // Making the GET request
  final response = await client.get(url, headers: headers);

  if (response.statusCode == 200) {
    final userJson = json.decode(response.body);
    final UserModel userModel = UserModel.fromJson(userJson['data']);
    return userModel;
  } else {
    throw ServerException();
  }
}


}