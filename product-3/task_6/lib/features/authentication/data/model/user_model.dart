import 'package:flutter/foundation.dart';

import '../../domain/entities/user_entity.dart';

class UserModel extends UserEntity{
  UserModel({required super.id, required super.name, required super.email});


  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
              id: json['id'], 
              name: json['name'], 
              email: json['email']);

  }

  Map<String, dynamic> toJson(){
    return{
      'id' : id,
      'name' : name,
      'email' : email
    };
  }

}