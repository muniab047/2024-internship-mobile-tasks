part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetSingleProductEvent extends ProductEvent{
  final GetProductParams getProductParams;

  GetSingleProductEvent({required this.getProductParams});

}
class LoadAllProductEvent extends ProductEvent{

}

class InsertProductEvent extends ProductEvent{
  final InsertProductParams insertProductParams;

  InsertProductEvent({required this.insertProductParams});

 
}

class UpdateProductEvent extends ProductEvent{
  final UpdateProductParams updateProductParams;

  UpdateProductEvent({required this.updateProductParams});

}


class DeleteProductEvent extends ProductEvent{
  final DeleteProductParams deleteProductParams;

  DeleteProductEvent({required this.deleteProductParams});
}




