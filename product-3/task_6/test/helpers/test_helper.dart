import 'dart:io';

import 'package:http/http.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/features/product/data/datasource/local_data_source.dart';
import 'package:task_6/features/product/domain/repositories/delete_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/get_all_products_repository.dart';
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/insert_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/update_product_repository.dart';
import 'package:task_6/features/product/domain/usecases/delete_product.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';
import 'package:task_6/features/product/domain/usecases/get_product.dart';
import 'package:task_6/features/product/domain/usecases/insert_product.dart';
import 'package:task_6/features/product/domain/usecases/update_product.dart';
import '../../lib/features/product/data/datasource/local_data_source.dart';
import '../../lib/features/product/data/datasource/remote_data_source.dart';
import '../../lib/core/network/network_info.dart';
import 'package:http/http.dart' as http;


@GenerateMocks(
  [
    UpdateProductRepository,
    GetProductRepository,
    DeleteProductRepository,
    InsertProductRepository,
    LocalDataSource,
    RemoteDataSource,
    NetworkInfo,
    InternetConnectionChecker,
    SharedPreferences,
    http.Client,
    GetAllProductsRepository,
    GetProduct,
    GetAllProducts,
    UpdateProduct,
    InsertProduct,
    DeleteProduct,
    MultipartRequest,
    
  ],
  
)

void main() {}