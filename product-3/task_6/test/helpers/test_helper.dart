import 'package:mockito/annotations.dart';
import 'package:task_6/features/product/data/datasource/local_data_source.dart';
import 'package:task_6/features/product/domain/repositories/delete_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/insert_product_repository.dart';
import 'package:task_6/features/product/domain/repositories/update_product_repository.dart';
import '../../lib/features/product/data/datasource/local_data_source.dart';
import '../../lib/features/product/data/datasource/remote_data_source.dart';
import '../../lib/core/platform/network_info.dart';


@GenerateMocks(
  [
    UpdateProductRepository,
    GetProductRepository,
    DeleteProductRepository,
    InsertProductRepository,
    LocalDataSource,
    RemoteDataSource,
    NetworkInfo
  ],
  
)

void main() {}