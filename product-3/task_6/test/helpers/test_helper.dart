import 'dart:io';

import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task_6/features/product/data/datasource/local_data_source.dart';
import 'package:task_6/features/product/domain/repositories/delete_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/insert_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/update_product_repository.dart';
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
    
    
  ],
  
)

void main() {}