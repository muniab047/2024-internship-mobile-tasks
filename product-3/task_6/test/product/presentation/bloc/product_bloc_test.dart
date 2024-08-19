import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/params.dart';
import 'package:task_6/features/product/domain/entities/product_entity.dart';
import 'package:task_6/features/product/domain/usecases/get_all_products.dart';
import 'package:task_6/features/product/domain/usecases/get_product.dart';
import 'package:task_6/features/product/presentation/bloc/product_bloc.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MockGetProduct mockGetProduct;
  late MockDeleteProduct mockDeleteProduct;
  late MockInsertProduct mockInsertProduct;
  late MockGetAllProducts mockGetAllProducts;
  late MockUpdateProduct mockUpdateProduct;
  late ProductBloc productBloc;

  setUp(() {
    mockGetProduct = MockGetProduct();
    mockUpdateProduct = MockUpdateProduct();
    mockGetAllProducts = MockGetAllProducts();
    mockInsertProduct = MockInsertProduct();
    mockDeleteProduct = MockDeleteProduct();
    productBloc = ProductBloc(
        getAllProducts: mockGetAllProducts,
        insertProduct: mockInsertProduct,
        updateProduct: mockUpdateProduct,
        deleteProduct: mockDeleteProduct,
        getProduct: mockGetProduct);
  });

  

  test('initial state should be empty', () {
    expect(productBloc.state, InitialState());
  });

  group('get Single Product', () {
    const tProductEntity = ProductEntity(
      image:'https://res.cloudinary.com/g5-mobile-track/image/upload/v1718777132/images/zxjhzrflkvsjutgbmr0f.jpg',
      description: "Explore anime characters.",
      name: "Anime website",
      price: 123.0,
      id: "6672752cbd218790438efdb0",
    );
    const tGetProductParams = GetProductParams(id: "6672752cbd218790438efdb0");

    blocTest<ProductBloc, ProductState>(
        'should return singleproduct loaded and loading',
        build: () {
          when(mockGetProduct.call(getProductParams: tGetProductParams))
              .thenAnswer((_) async => Right(tProductEntity));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(GetSingleProductEvent(getProductParams: tGetProductParams)),
        wait: Duration(milliseconds: 500),
        expect: () => {
              Loading(),
              LoadedSingleProductState(productEntity: tProductEntity)
            });

    blocTest<ProductBloc, ProductState>('should return failure',
        build: () {
          when(mockGetProduct.call(getProductParams: tGetProductParams))
              .thenAnswer((_) async => Left(ServerFailure()));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(GetSingleProductEvent(getProductParams: tGetProductParams)),
        wait: Duration(milliseconds: 500),
        expect: () => {Loading(), ErrorState(message: 'server failure')});
  });

  group('get all products', (){
    const List<ProductEntity> tAllProducts = [
    ProductEntity(
      image: 'assets/img/p4.jpg',
      description: "Explore anime characters.",
      name: "Anime website",
      price: 12.0,
      id: "6672752cbd218790438efdb0",
    ),
    ProductEntity(
      image: 'assets/img/p4.jpg',
      description: "Explore anime characters.",
      name: "Anime website",
      price: 12.0,
      id: "6672752cbd218790438efdb0",
    ),
    ProductEntity(
      image: 'assets/img/p4.jpg',
      description: "Explore anime characters.",
      name: "Anime website",
      price: 12.0,
      id: "6672752cbd218790438efdb0",
    )
  ];

  blocTest<ProductBloc, ProductState>(
      'should emit loading and allProduct loaded', build: () {
    when(mockGetAllProducts.call()).thenAnswer((_) async => Right(tAllProducts));
    return productBloc;
  },
  act: (bloc) => {bloc.add(LoadAllProductEvent())},
  expect: () =>{Loading(), LoadedAllProductState(allProducts: tAllProducts)}
  );

   blocTest<ProductBloc, ProductState>(
      'should emit loading and failure', build: () {
    when(mockGetAllProducts.call()).thenAnswer((_) async => Left(ServerFailure()));
    return productBloc;
  },
  act: (bloc) => {bloc.add(LoadAllProductEvent())},
  expect: () =>{Loading(), ErrorState(message: 'server failure')}
  );


  });


  
  group('insert Product', () {
    final  tInsertProductParams = InsertProductParams(
      image: XFile('C:\\Users\\trt\\Pictures\\1b70f5fb14bc1f6bd9fac8e76629219a.jpg'),
      description: "Explore anime characters.",
      name: "Anime website",
      price: '12.0',
      );

    blocTest<ProductBloc, ProductState>(
        'should return singleproduct loaded and loading',
        build: () {
          when(mockInsertProduct.call(insertProductParams: tInsertProductParams))
              .thenAnswer((_) async => Right(unit));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(InsertProductEvent(insertProductParams: tInsertProductParams)),
        wait: Duration(milliseconds: 500),
        expect: () => {
              Waiting(),
              SuccessState(message: 'product inserted successfully')
            });

    blocTest<ProductBloc, ProductState>('should return failure',
        build: () {
          when(mockInsertProduct.call(insertProductParams: tInsertProductParams))
              .thenAnswer((_) async => Left(ServerFailure()));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(InsertProductEvent(insertProductParams: tInsertProductParams)),
        wait: Duration(milliseconds: 500),
        expect: () => {Waiting(), ErrorState(message: 'server failure')});
  });



   group('update Product', () {
    const tUpdateProductParams = UpdateProductParams(
      description: "Explore anime characters.",
      name: "Anime website",
      price: 12.0,
      id: "6672752cbd218790438efdb0",);

    blocTest<ProductBloc, ProductState>(
        'should return initial and loading',
        build: () {
          when(mockUpdateProduct.call(updateProductParams: tUpdateProductParams))
              .thenAnswer((_) async => Right(unit));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(UpdateProductEvent(updateProductParams: tUpdateProductParams)),
        
        expect: () => {
              Waiting(),
              SuccessState(message: 'product updated successfully')
            });

    blocTest<ProductBloc, ProductState>('should return failure',
        build: () {
          when(mockUpdateProduct.call(updateProductParams: tUpdateProductParams))
              .thenAnswer((_) async => Left(ServerFailure()));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(UpdateProductEvent(updateProductParams: tUpdateProductParams)),
        expect: () => {Waiting(), ErrorState(message: 'server failure')});
  });


   group('delete Product', () {
    const tDeleteProductParams = DeleteProductParams(
      id: "6672752cbd218790438efdb0",);

    blocTest<ProductBloc, ProductState>(
        'should return singleproduct loaded and loading',
        build: () {
          when(mockDeleteProduct.call(deleteProductParams: tDeleteProductParams))
              .thenAnswer((_) async => Right(unit));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(DeleteProductEvent(deleteProductParams: tDeleteProductParams)),
      
        expect: () => {
              Loading(),
              SuccessState(message: 'product deleted successfully')
            });

    blocTest<ProductBloc, ProductState>('should return failure',
        build: () {
          when(mockDeleteProduct.call(deleteProductParams: tDeleteProductParams))
              .thenAnswer((_) async => Left(ServerFailure()));
          return productBloc;
        },
        act: (bloc) => bloc
            .add(DeleteProductEvent(deleteProductParams: tDeleteProductParams)),
        expect: () => {Loading(), ErrorState(message: 'server failure')});
  });




 
}
