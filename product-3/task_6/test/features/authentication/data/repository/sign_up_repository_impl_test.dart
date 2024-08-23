import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/auth_params.dart';
import 'package:task_6/features/authentication/data/repositories/sign_up_repository_impl.dart';

import '../../../../helpers/test_helper.mocks.dart';


void main() {
  late SignUpRepositoryImpl repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = SignUpRepositoryImpl(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  final testSignUpParams = SignUpParams(email: 'test@example.com', password: 'password', name: 'Test User');

  group('signUp', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.signUp(any)).thenAnswer((_) async => unit);

      // act
      await repository.signUp(testSignUpParams);

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    test('should return Right(Unit) when signUp is successful', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.signUp(any)).thenAnswer((_) async => unit);

      // act
      final result = await repository.signUp(testSignUpParams);

      // assert
      expect(result, Right(unit));
      verify(mockRemoteDataSource.signUp(testSignUpParams));
    });

    test('should return Left(ServerFailure) when a ServerException is thrown', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.signUp(any)).thenThrow(ServerException());

      // act
      final result = await repository.signUp(testSignUpParams);

      // assert
      expect(result, Left(ServerFailure()));
    });

    test('should return Left(ConnectionFailure) when the device is offline', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.signUp(testSignUpParams);

      // assert
      expect(result, Left(ConnectionFailure()));
      verifyNever(mockRemoteDataSource.signUp(any));
    });
  });
}
