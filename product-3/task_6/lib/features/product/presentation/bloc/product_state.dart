part of 'product_bloc.dart';

@immutable
sealed class ProductState extends Equatable {

  @override
List<Object> get props => [];

}

final class InitialState extends ProductState {
 @override
List<Object> get props => [];
  
}

final class Loading extends ProductState{

  @override
List<Object> get props => [];
}

final class Waiting extends ProductState{

}

final class LoadedSingleProductState extends ProductState{
  final ProductEntity productEntity;

  LoadedSingleProductState({required this.productEntity});


  @override
  List<Object> get props => [productEntity];}


final class LoadedAllProductState extends ProductState{
  final List<ProductEntity> allProducts;

  LoadedAllProductState({required this.allProducts});
}

final class DeleteSuccessState extends ProductState{
  final String message;

  DeleteSuccessState({required this.message});


  @override
  List<Object> get props => [];

}

final class UpdateSuccessState extends ProductState{
  final String message;

  UpdateSuccessState({required this.message});


  @override
  List<Object> get props => [];

}

final class InsertSuccessState extends ProductState{
  final String message;

  InsertSuccessState({required this.message});


  @override
  List<Object> get props => [];

}



final class ErrorState extends ProductState{
  final String message;

  ErrorState({required this.message});


  @override
  List<Object> get props => [];

}


