import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:rxdart/rxdart.dart';

import '../../../../core/params/params.dart';
import '../../domain/entities/product_entity.dart';
import '../../domain/usecases/delete_product.dart';
import '../../domain/usecases/get_all_products.dart';
import '../../domain/usecases/get_product.dart';
import '../../domain/usecases/insert_product.dart';
import '../../domain/usecases/update_product.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProduct getProduct;
  final GetAllProducts getAllProducts;
  final InsertProduct insertProduct;
  final UpdateProduct updateProduct;
  final DeleteProduct deleteProduct;
  
  ProductBloc({required this.getAllProducts, required this.insertProduct, required this.updateProduct, required this.deleteProduct, required this.getProduct}) : super(InitialState()) {

    on<GetSingleProductEvent>((event, emit) async{
      // TODO: implement event handler
      emit(Loading());
      final result = await getProduct.call(getProductParams: event.getProductParams);
      
      result.fold(
        (failure){
          emit(ErrorState(message: 'server failure'));
        },
        (data){
        
          emit(LoadedSingleProductState(productEntity: data));
        }
      );

    },
  
    transformer: debounce(Duration(milliseconds: 500)));

    on<LoadAllProductEvent>((event, emit) async{
      emit(Loading());
      final result = await getAllProducts.call();
      result.fold(
        (failure){
          emit(ErrorState(message: 'server failure'));
        }, (data){
          emit(LoadedAllProductState(allProducts: data));

        });
      
     });

    on<UpdateProductEvent>((event, emit) async{
      emit(Waiting());
      final result = await updateProduct.call(updateProductParams: event.updateProductParams);

      result.fold(
        (failure){
          emit(ErrorState(message: 'server failure'));
        },
        (data){
          emit(SuccessState(message: 'Product updated successfully!'));
          
        }
      );
    });


     on<DeleteProductEvent>((event, emit) async{
      emit(Loading());
      final result = await deleteProduct.call(deleteProductParams: event.deleteProductParams);

      result.fold(
        (failure){
          emit(ErrorState(message: 'server failure'));
        },
        (data){
          emit(SuccessState(message: 'Product deleted successfully!'));
          
        }
      );
    });

     on<InsertProductEvent>((event, emit) async{
      emit(Waiting());
      final result = await insertProduct.call(insertProductParams: event.insertProductParams);

      result.fold(
        (failure){
          emit(ErrorState(message: 'server failure'));
        },
        (data){
          emit(SuccessState(message: 'Product added successfully!'));
          
        }
      );
    });


  }
} 

EventTransformer<T> debounce <T>(Duration duration){
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}
