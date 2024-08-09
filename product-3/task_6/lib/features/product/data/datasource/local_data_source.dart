import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/params/params.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future <ProductModel> getProduct(GetProductParams getProductParams);
  Future <Unit> cacheProduct (ProductModel productToCache);
 

}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  

  @override
  Future<ProductModel> getProduct(GetProductParams getProductParams) {
    // TODO: implement getProduct
    final jsonString = sharedPreferences.getString('CACHED_PRODUCT');

    if (jsonString != null){

    return Future.value(ProductModel.fromJson(json.decode(jsonString??'')));
    }else{
      throw CacheException();
    }
   
  }

  @override
  Future<Unit> cacheProduct(ProductModel productToCache) {
    // TODO: implement cacheProduct
    return sharedPreferences.setString('CACHED_PRODUCT', json.encode(productToCache.toJson())).then((value) => unit);
    
  }

}