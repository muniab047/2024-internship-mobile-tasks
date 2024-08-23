import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/features/authentication/data/repositories/logout_repository_impl.dart';


import '../../../../helpers/test_helper.mocks.dart';


void main() {
  late LogoutRepositoryImpl repository;
  late MockAuthLocalDataSource mockLocalDataSource;
  late MockNetworkInfo mockNetworkInfo;
  late MockAuthRemoteDataSource mockRemoteDataSource;

  setUp(() {
    mockLocalDataSource = MockAuthLocalDataSource();
    mockNetworkInfo = MockNetworkInfo();
    mockRemoteDataSource = MockAuthRemoteDataSource();
    repository = LogoutRepositoryImpl(
      localDataSource: mockLocalDataSource,
      networkInfo: mockNetworkInfo,
      remoteDataSource: mockRemoteDataSource,
    );
  });

  group('logout', () {
    test('should clear the token locally', () async {
      // arrange
      when(mockLocalDataSource.clearToken()).thenAnswer((_) async => unit);

      // act
      final result = await repository.logout();

      // assert
      expect(result, equals(unit));
      verify(mockLocalDataSource.clearToken());
    });

   
  });
}
