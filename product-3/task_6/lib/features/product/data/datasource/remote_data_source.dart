import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/params/params.dart';
import '../../domain/entities/product_entity.dart';
import '../models/product_model.dart';
import 'package:http/http.dart';

abstract class RemoteDataSource {
  Future<ProductModel> getProduct(GetProductParams getProductParams);
  Future <Unit> insertProduct(InsertProductParams insertProductParams);
  Future <Unit> updateProduct(UpdateProductParams updateProductParams);
  Future <Unit> deleteProduct(DeleteProductParams deleteProductParams);
  Future<List<ProductModel>> getAllProducts();
 
  
  

}


class RemoteDataSourceImpl implements RemoteDataSource{
  final Client client;

  RemoteDataSourceImpl({required this.client});

  @override
  Future<ProductModel> getProduct(GetProductParams getProductParams) async{
    // TODO: implement getProduct
    final response = await client.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${getProductParams.id}'),headers: {'Content-Type': 'application/json'});
    if (response.statusCode == 200){

    return ProductModel.fromJson(json.decode(response.body));
    }else{
      throw ServerException();
    }
  }

  @override
  Future<Unit> insertProduct(InsertProductParams insertProductParams) async{
    // TODO: implement insertProduct
    final jsonString = json.encode(ProductModel(
                  image: insertProductParams.image, 
                  description: insertProductParams.description, 
                  name: insertProductParams.name, 
                  price: insertProductParams.price, 
                  id: insertProductParams.id).toJson());
    final response = await client.post(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'), body: jsonString ,headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200){
      return unit;
    }
    else{
      throw(ServerException());
    }
  }

  @override
  Future<Unit> deleteProduct(DeleteProductParams deleteProductParams)async {
    // TODO: implement deleteProduct
  
    final response = await client.delete(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${deleteProductParams.id}'), headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200){
      return unit;
    }
    else{
      throw(ServerException());
    }
  }



  @override
  Future<Unit> updateProduct(UpdateProductParams updateProductParams) async {
    // TODO: implement updateProduct
    final jsonString = json.encode(ProductModel(
                  image: updateProductParams.image, 
                  description: updateProductParams.description, 
                  name: updateProductParams.name, 
                  price: updateProductParams.price, 
                  id: updateProductParams.id).toJson());
    final response = await client.put(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products/${updateProductParams.id}'), body: jsonString ,headers: {'Content-Type': 'application/json'});

    if (response.statusCode == 200){
      return unit;
    }
    else{
      throw(ServerException());
    }
  }
  
  @override
  Future<List<ProductModel>> getAllProducts() async{
    // TODO: implement getAllproducts
    final response = await client.get(Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v1/products'), headers: {'Content-Type' : 'application/json'});
    if (response.statusCode == 200) {
      final List<dynamic> productListJson = json.decode(response.body)['data'];
      final List<ProductModel> productModelList = productListJson.map((productJson) => ProductModel.fromJson(productJson)).toList();
      return productModelList;
      
    } else {
      throw ServerException();
    }
  }

}