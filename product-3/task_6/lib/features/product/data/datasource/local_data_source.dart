import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/params/params.dart';
import '../models/product_model.dart';

abstract class LocalDataSource {
  Future <ProductModel> getProduct(GetProductParams getProductParams);
  Future <Unit> cacheProduct (ProductModel productToCache);
  Future<List<ProductModel>> getAllProducts();
  Future<Unit> cacheAllProducts(List<ProductModel> productModelsTocache);
 

}

class LocalDataSourceImpl implements LocalDataSource{
  final SharedPreferences sharedPreferences;

  LocalDataSourceImpl({required this.sharedPreferences});

  

  @override
  Future<ProductModel> getProduct(GetProductParams getProductParams) {
    // TODO: implement getProduct
    final jsonString = sharedPreferences.getString(getProductParams.id);

    if (jsonString != null){

    return Future.value(ProductModel.fromJson(json.decode(jsonString)));
    }else{
      throw CacheException();
    }
   
  }

  @override
  Future<Unit> cacheProduct(ProductModel productToCache) {
    // TODO: implement cacheProduct
    return sharedPreferences.setString(productToCache.id, json.encode(productToCache.toJson())).then((value) => unit);
    
  }
  
  @override
  Future<List<ProductModel>> getAllProducts()async{
    // TODO: implement getAllproducts
    final allProductJsonString = sharedPreferences.getString('CACHED_ALL_PRODUCTS');
    if (allProductJsonString != null){

    final List<dynamic> allProductsJson = await json.decode(allProductJsonString)['data'];
    final List<ProductModel> allProductsModels = allProductsJson.map((productJson)=> ProductModel.fromJson(productJson)).toList();
   
    return allProductsModels;
    }
    else{
      throw CacheException();
    }

  }
  
  @override
  Future<Unit> cacheAllProducts(List<ProductModel> productModelsTocache) {
    // TODO: implement cacheAllProducts
    final allProductsJsonString = json.encode(productModelsTocache);
    return sharedPreferences.setString('CACHED_ALL_PRODUCTS', allProductsJsonString).then((value) => unit);
    
  }

}