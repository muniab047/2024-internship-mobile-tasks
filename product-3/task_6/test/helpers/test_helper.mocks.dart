// Mocks generated by Mockito 5.4.4 from annotations
// in task_6/test/helpers/test_helper.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i5;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:task_6/core/errors/failure.dart' as _i6;
import 'package:task_6/core/params/params.dart' as _i7;
import 'package:task_6/core/platform/network_info.dart' as _i14;
import 'package:task_6/features/product/data/datasource/local_data_source.dart'
    as _i12;
import 'package:task_6/features/product/data/datasource/remote_data_source.dart'
    as _i13;
import 'package:task_6/features/product/data/models/product_model.dart' as _i3;
import 'package:task_6/features/product/domain/entities/product_entity.dart'
    as _i9;
import 'package:task_6/features/product/domain/repositories/delete_product_repository.dart'
    as _i10;
import 'package:task_6/features/product/domain/repositories/get_product_repository.dart'
    as _i8;
import 'package:task_6/features/product/domain/repositories/insert_product_repository.dart'
    as _i11;
import 'package:task_6/features/product/domain/repositories/update_product_repository.dart'
    as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: deprecated_member_use
// ignore_for_file: deprecated_member_use_from_same_package
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeProductModel_1 extends _i1.SmartFake implements _i3.ProductModel {
  _FakeProductModel_1(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

class _FakeUnit_2 extends _i1.SmartFake implements _i2.Unit {
  _FakeUnit_2(
    Object parent,
    Invocation parentInvocation,
  ) : super(
          parent,
          parentInvocation,
        );
}

/// A class which mocks [UpdateProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockUpdateProductRepository extends _i1.Mock
    implements _i4.UpdateProductRepository {
  MockUpdateProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>> updateProduct(
          {required _i7.UpdateProductParams? updateProductParams}) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [],
          {#updateProductParams: updateProductParams},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i6.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #updateProduct,
            [],
            {#updateProductParams: updateProductParams},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>);
}

/// A class which mocks [GetProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockGetProductRepository extends _i1.Mock
    implements _i8.GetProductRepository {
  MockGetProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i9.ProductEntity>> getProduct(
          {required _i7.GetProductParams? getProductParams}) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [],
          {#getProductParams: getProductParams},
        ),
        returnValue:
            _i5.Future<_i2.Either<_i6.Failure, _i9.ProductEntity>>.value(
                _FakeEither_0<_i6.Failure, _i9.ProductEntity>(
          this,
          Invocation.method(
            #getProduct,
            [],
            {#getProductParams: getProductParams},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i9.ProductEntity>>);
}

/// A class which mocks [DeleteProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockDeleteProductRepository extends _i1.Mock
    implements _i10.DeleteProductRepository {
  MockDeleteProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>> deleteProduct(
          {required _i7.DeleteProductParams? deleteProductParams}) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [],
          {#deleteProductParams: deleteProductParams},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i6.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #deleteProduct,
            [],
            {#deleteProductParams: deleteProductParams},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>);
}

/// A class which mocks [InsertProductRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockInsertProductRepository extends _i1.Mock
    implements _i11.InsertProductRepository {
  MockInsertProductRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>> insertProduct(
          {required _i7.InsertProductParams? insertProductParams}) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [],
          {#insertProductParams: insertProductParams},
        ),
        returnValue: _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>.value(
            _FakeEither_0<_i6.Failure, _i2.Unit>(
          this,
          Invocation.method(
            #insertProduct,
            [],
            {#insertProductParams: insertProductParams},
          ),
        )),
      ) as _i5.Future<_i2.Either<_i6.Failure, _i2.Unit>>);
}

/// A class which mocks [LocalDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockLocalDataSource extends _i1.Mock implements _i12.LocalDataSource {
  MockLocalDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.ProductModel> getProduct(
          _i7.GetProductParams? getProductParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [getProductParams],
        ),
        returnValue: _i5.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [getProductParams],
          ),
        )),
      ) as _i5.Future<_i3.ProductModel>);
}

/// A class which mocks [RemoteDataSource].
///
/// See the documentation for Mockito's code generation for more information.
class MockRemoteDataSource extends _i1.Mock implements _i13.RemoteDataSource {
  MockRemoteDataSource() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<_i3.ProductModel> getProduct(
          _i7.GetProductParams? getProductParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #getProduct,
          [getProductParams],
        ),
        returnValue: _i5.Future<_i3.ProductModel>.value(_FakeProductModel_1(
          this,
          Invocation.method(
            #getProduct,
            [getProductParams],
          ),
        )),
      ) as _i5.Future<_i3.ProductModel>);

  @override
  _i5.Future<_i2.Unit> insertProduct(
          _i7.InsertProductParams? insertProductParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #insertProduct,
          [insertProductParams],
        ),
        returnValue: _i5.Future<_i2.Unit>.value(_FakeUnit_2(
          this,
          Invocation.method(
            #insertProduct,
            [insertProductParams],
          ),
        )),
      ) as _i5.Future<_i2.Unit>);

  @override
  _i5.Future<_i2.Unit> updateProduct(
          _i7.UpdateProductParams? updateProductParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #updateProduct,
          [updateProductParams],
        ),
        returnValue: _i5.Future<_i2.Unit>.value(_FakeUnit_2(
          this,
          Invocation.method(
            #updateProduct,
            [updateProductParams],
          ),
        )),
      ) as _i5.Future<_i2.Unit>);

  @override
  _i5.Future<_i2.Unit> deleteProduct(
          _i7.DeleteProductParams? deleteProductParams) =>
      (super.noSuchMethod(
        Invocation.method(
          #deleteProduct,
          [deleteProductParams],
        ),
        returnValue: _i5.Future<_i2.Unit>.value(_FakeUnit_2(
          this,
          Invocation.method(
            #deleteProduct,
            [deleteProductParams],
          ),
        )),
      ) as _i5.Future<_i2.Unit>);

  @override
  _i5.Future<_i2.Unit> cacheProduct(_i3.ProductModel? productToCache) =>
      (super.noSuchMethod(
        Invocation.method(
          #cacheProduct,
          [productToCache],
        ),
        returnValue: _i5.Future<_i2.Unit>.value(_FakeUnit_2(
          this,
          Invocation.method(
            #cacheProduct,
            [productToCache],
          ),
        )),
      ) as _i5.Future<_i2.Unit>);
}

/// A class which mocks [NetworkInfo].
///
/// See the documentation for Mockito's code generation for more information.
class MockNetworkInfo extends _i1.Mock implements _i14.NetworkInfo {
  MockNetworkInfo() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i5.Future<bool> get isConnected => (super.noSuchMethod(
        Invocation.getter(#isConnected),
        returnValue: _i5.Future<bool>.value(false),
      ) as _i5.Future<bool>);
}
