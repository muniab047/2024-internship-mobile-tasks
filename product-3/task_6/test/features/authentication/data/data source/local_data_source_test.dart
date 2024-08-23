import 'package:mockito/mockito.dart';
import 'package:task_6/features/authentication/data/data%20sources/local_data_source.dart';
import 'package:task_6/features/authentication/data/model/user_model.dart';
import 'package:test/test.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../helpers/test_helper.mocks.dart';


// Mock classes




void main() {
  late AuthLocalDataSourceImpl dataSource;
  late MockFlutterSecureStorage mockSecureStorage;
  late MockSharedPreferences mockSharedPreferences;

  setUp(() {
    mockSecureStorage = MockFlutterSecureStorage();
    mockSharedPreferences = MockSharedPreferences();
    dataSource = AuthLocalDataSourceImpl(
      securedStorage: mockSecureStorage,
      sharedPreferences: mockSharedPreferences,
    );
  });

  group('getToken', () {
    const testToken = 'test_token';

    test('should return token from secure storage', () async {
      // arrange
      when(mockSecureStorage.read(key: 'TOKEN')).thenAnswer((_) async => testToken);
      
      // act
      final result = await dataSource.getToken();
      
      // assert
      expect(result, equals(testToken));
      verify(mockSecureStorage.read(key: 'TOKEN'));
      verifyNoMoreInteractions(mockSecureStorage);
    });
  });

  group('storeToken', () {
    const testToken = 'test_token';

    test('should store token in secure storage', () async {
      // act
      await dataSource.storeToken(testToken);

      // assert
      verify(mockSecureStorage.write(key: 'TOKEN', value: testToken));
      verifyNoMoreInteractions(mockSecureStorage);
    });
  });

  group('clearToken', () {
    test('should delete token from secure storage', () async {
      // act
      await dataSource.clearToken();

      // assert
      verify(mockSecureStorage.delete(key: 'TOKEN'));
      verifyNoMoreInteractions(mockSecureStorage);
    });
  });

  group('cacheUserInfo', () {
    final testUserModel = UserModel(id: '1', name: 'John Doe', email: 'john.doe@example.com');
    final cachedUserInfo = json.encode(testUserModel);

    test('should cache user info in shared preferences', () async {
      // arrange
      when(mockSharedPreferences.setString('USER_INFO', cachedUserInfo))
          .thenAnswer((_) async => true);

      // act
      await dataSource.cacheUserInfo(testUserModel);

      // assert
      verify(mockSharedPreferences.setString('USER_INFO', cachedUserInfo));
      verifyNoMoreInteractions(mockSharedPreferences);
    });
  });
}
