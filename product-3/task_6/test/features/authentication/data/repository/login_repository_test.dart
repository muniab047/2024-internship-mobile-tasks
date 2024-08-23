import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/errors/failure.dart';
import 'package:task_6/core/params/auth_params.dart';
import 'package:task_6/features/authentication/data/model/user_model.dart';
import 'package:task_6/features/authentication/data/repositories/login_repository_impl.dart';
import 'package:task_6/features/authentication/domain/entities/user_entity.dart';

import '../../../../helpers/test_helper.mocks.dart';



void main() {
  late LoginRepositoryImpl repository;
  late MockNetworkInfo mockNetworkInfo;
  late MockAuthRemoteDataSource mockRemoteDataSource;
  late MockAuthLocalDataSource mockLocalDataSource;

  setUp(() {
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockAuthRemoteDataSource();
    mockLocalDataSource = MockAuthLocalDataSource();
    repository = LoginRepositoryImpl(
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
      localDataSource: mockLocalDataSource,
    );
  });

  final testLoginParams = LoginParams(email: 'test@example.com', password: 'password');
  const testToken = 'test_token';
  final testUserModel = UserModel(id: '1', name: 'John Doe', email: 'john.doe@example.com');
  final UserEntity testUserEntity = testUserModel;

  group('login', () {
    test('should check if the device is online', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.login(any)).thenAnswer((_) async => testToken);
      when(mockRemoteDataSource.getMe(any)).thenAnswer((_) async => testUserModel);
      when(mockLocalDataSource.storeToken(any)).thenAnswer((_)async => unit);
      when(mockLocalDataSource.cacheUserInfo(any)).thenAnswer((_)async => unit);

      // act
      await repository.login(testLoginParams);

      // assert
      verify(mockNetworkInfo.isConnected);
    });

    test('should return Right(UserEntity) when login is successful', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.login(any)).thenAnswer((_) async => testToken);
      when(mockRemoteDataSource.getMe(any)).thenAnswer((_) async => testUserModel);
      when(mockLocalDataSource.storeToken(any)).thenAnswer((_) async => unit);
      when(mockLocalDataSource.cacheUserInfo(any)).thenAnswer((_) async => unit);

      // act
      final result = await repository.login(testLoginParams);

      // assert
      expect(result, Right(testUserEntity));
      verify(mockRemoteDataSource.login(testLoginParams));
      //verify(mockLocalDataSource.storeToken(testToken));
      verify(mockRemoteDataSource.getMe(any));
      //verify(mockLocalDataSource.cacheUserInfo(testUserModel));
    });

    test('should return Left(ServerFailure) when a ServerException is thrown', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.login(any)).thenThrow(ServerException());

      // act
      final result = await repository.login(testLoginParams);

      // assert
      expect(result, Left(ServerFailure()));
    });

    test('should return Left(Unauthorized) when an UnauthorizedException is thrown', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => true);
      when(mockRemoteDataSource.login(any)).thenThrow(UnauthorizedException());

      // act
      final result = await repository.login(testLoginParams);

      // assert
      expect(result, Left(Unauthorized()));
    });

    test('should return Left(ConnectionFailure) when the device is offline', () async {
      // arrange
      when(mockNetworkInfo.isConnected).thenAnswer((_) async => false);

      // act
      final result = await repository.login(testLoginParams);

      // assert
      expect(result, Left(ConnectionFailure()));
      verifyNever(mockRemoteDataSource.login(any));
    });
  });
}
