import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'core/util/input_converter.dart';
import 'features/authentication/data/data sources/local_data_source.dart';
import 'features/authentication/data/data sources/remote_data_source.dart';
import 'features/authentication/data/repositories/login_repository_impl.dart';
import 'features/authentication/data/repositories/logout_repository_impl.dart';
import 'features/authentication/data/repositories/sign_up_repository_impl.dart';
import 'features/authentication/domain/repositories/login_repository.dart';
import 'features/authentication/domain/repositories/logout_repository.dart';
import 'features/authentication/domain/repositories/sign_up_repository.dart';
import 'features/authentication/domain/use cases/login.dart';
import 'features/authentication/domain/use cases/logout.dart';
import 'features/authentication/domain/use cases/sign_up.dart';
import 'features/authentication/presentation/bloc/auth_bloc.dart';
import 'features/product/data/datasource/local_data_source.dart';
import 'features/product/data/datasource/remote_data_source.dart';
import 'features/product/data/repositories/delete_product_repository_impl.dart';
import 'features/product/data/repositories/get_all_products_repository_impl.dart';
import 'features/product/data/repositories/get_product_repository_impl.dart';
import 'features/product/data/repositories/insert_product_repository_impl.dart';
import 'features/product/data/repositories/update_product_repository_impl.dart';
import 'features/product/domain/repositories/delete_product_repository.dart';
import 'features/product/domain/repositories/get_all_products_repository.dart';
import 'features/product/domain/repositories/get_product_repository.dart';
import 'features/product/domain/repositories/insert_product_repository.dart';
import 'features/product/domain/repositories/update_product_repository.dart';
import 'features/product/domain/usecases/delete_product.dart';
import 'features/product/domain/usecases/get_all_products.dart';
import 'features/product/domain/usecases/get_product.dart';
import 'features/product/domain/usecases/insert_product.dart';
import 'features/product/domain/usecases/update_product.dart';
import 'features/product/presentation/bloc/product_bloc.dart';

final sl = GetIt.instance;
Future <void> init() async{
  //! Features 
  
  //*- product

  // Bloc
  sl.registerFactory(() => ProductBloc(
          getAllProducts: sl(), 
          insertProduct: sl(), 
          updateProduct: sl(), 
          deleteProduct: sl(), 
          getProduct: sl()));
  sl.registerLazySingleton(() => GetAllProducts(getAllProductsRepository: sl()));
  sl.registerLazySingleton(() => InsertProduct(insertProductRepository: sl()));
  sl.registerLazySingleton(() => UpdateProduct(updateProductRepository: sl()));
  sl.registerLazySingleton(() => DeleteProduct(deleteProductRepository: sl()));
  sl.registerLazySingleton(() => GetProduct(getProductRepository: sl()));


  sl.registerLazySingleton<GetAllProductsRepository>(() => GetAllProductsRepositoryImpl(networkInfo: sl(), localDataSource: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<GetProductRepository>(() => GetProductRepositoryImpl(localDataSource: sl(), remoteDataSource: sl(), networkInfo: sl()));
  sl.registerLazySingleton<InsertProductRepository>(() => InsertProductRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<UpdateProductRepository>(() => UpdateProductRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<DeleteProductRepository>(() => DeleteProductRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  
  sl.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl(sharedPreferences: sl()));
  sl.registerLazySingleton<RemoteDataSource>(() => RemoteDataSourceImpl(client: sl()));

 
  //* authrntication

  sl.registerFactory(() => AuthBloc(login: sl(), logout: sl(), signUp: sl()))  ;

  sl.registerLazySingleton(() => Login(loginRepository: sl()));
  sl.registerLazySingleton(()=> Logout(logoutRepository: sl()));
  sl.registerLazySingleton(()=>SignUp(signUpRepository: sl()));

  sl.registerLazySingleton<LoginRepository>(()=> LoginRepositoryImpl(localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<LogoutRepository>(()=>LogoutRepositoryImpl(localDataSource: sl(), networkInfo: sl(), remoteDataSource: sl()));
  sl.registerLazySingleton<SignUpRepository>(()=>SignUpRepositoryImpl(networkInfo: sl(), remoteDataSource: sl()));

  sl.registerLazySingleton<AuthLocalDataSource>(()=>AuthLocalDataSourceImpl(securedStorage: sl(), sharedPreferences: sl()));
  sl.registerLazySingleton<AuthRemoteDataSource>(()=>AuthRemoteDataSourceImpl(client: sl()));




  //! Core 

  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(internetConnectionChecker: sl()));
  sl.registerLazySingleton(() => InputConverter());


  //! External

  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
  sl.registerLazySingleton(()=> FlutterSecureStorage());

    

}