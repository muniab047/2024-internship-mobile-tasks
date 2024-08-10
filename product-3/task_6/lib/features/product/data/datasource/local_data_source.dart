import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/params/params.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future <ProductModel> getProduct(GetProductParams getProductParams);
  Future <Unit> cacheProduct (ProductModel productToCache);
  Future<List<ProductModel>> getAllproducts();
  Future<Unit> cacheAllProducts(List<ProductModel> productModelsTocache);
 

}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  

  @override
  Future<ProductModel> getProduct(GetProductParams getProductParams) {
    // TODO: implement getProduct
    final jsonString = sharedPreferences.getString('CACHED_PRODUCT');

    if (jsonString != null){

    return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException();
    }
   
  }

  @override
  Future<Unit> cacheProduct(ProductModel productToCache) {
    // TODO: implement cacheProduct
    return sharedPreferences.setString('CACHED_PRODUCT', json.encode(productToCache.toJson())).then((value) => unit);
    
  }
  
  @override
  Future<List<ProductModel>> getAllproducts(){
    // TODO: implement getAllproducts
    final allProductJsonStrings = sharedPreferences.getStringList('CACHED_ALL_PRODUCTS');
    if (allProductJsonStrings != null){

    final allProductModels = allProductJsonStrings.map((productJson)=> ProductModel.fromJson(json.decode(productJson))).toList();
    return Future.value(allProductModels) ;
    }
    else{
      throw CacheException();
    }

  }
  
  @override
  Future<Unit> cacheAllProducts(List<ProductModel> productModelsTocache) {
    // TODO: implement cacheAllProducts
    final allProductsJsonString = productModelsTocache.map((productModel)=> json.encode(productModel.toJson())).toList();
    return sharedPreferences.setStringList('CACHED_ALL_PRODUCTS', allProductsJsonString).then((value) => unit);
    
  }

}