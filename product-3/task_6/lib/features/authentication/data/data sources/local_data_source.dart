import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/user_model.dart';

abstract class AuthLocalDataSource {
    Future<Unit> storeToken(String token);
    Future<String> getToken();
    Future<Unit>clearToken();
    Future<Unit>cacheUserInfo(UserModel userToCache);
  }


class AuthLocalDataSourceImpl implements AuthLocalDataSource{
  final FlutterSecureStorage securedStorage;
  final SharedPreferences sharedPreferences;

  AuthLocalDataSourceImpl({required this.securedStorage, required this.sharedPreferences});
  @override
  Future<String> getToken() async{
    // TODO: implement getToken
    final token = await securedStorage.read(key: 'TOKEN');
    return token as String;
  }

  @override
  Future<Unit> storeToken(String token)async {
    // TODO: implement storeToken

    await securedStorage.write(key: 'TOKEN', value: token);
    return unit;
  
  }
  
  @override
  Future<Unit> clearToken() async{
    // TODO: implement clearToken
    await securedStorage.delete(key: 'TOKEN');
    return unit;
  }
  
  @override
  Future<Unit> cacheUserInfo(UserModel userToCache) {
    // TODO: implement cacheUserInfo
    return sharedPreferences.setString('USER_INFO', json.encode(userToCache)).then((value)=> unit);
    
  }

}