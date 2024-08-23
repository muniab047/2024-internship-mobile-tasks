import 'package:mockito/mockito.dart';
import 'package:task_6/core/errors/exception.dart';
import 'package:task_6/core/params/auth_params.dart';
import 'package:task_6/features/authentication/data/data%20sources/remote_data_source.dart';
import 'package:task_6/features/authentication/data/model/user_model.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../helpers/test_helper.mocks.dart';


void main() {
  late AuthRemoteDataSourceImpl dataSource;
  late MockClient mockHttpClient;

  setUp(() {
    mockHttpClient = MockClient();
    dataSource = AuthRemoteDataSourceImpl(client: mockHttpClient);
  });

  group('login', () {
      final testLoginParams = LoginParams(email: 'test@example.com', password: 'password');
    const testToken = 'test_token';
    final testUrl = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/login');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode(testLoginParams.toJson());

    test('should return token when the response code is 201 (success)', () async {
      // arrange
      Map<String, String> testVal = {
      'email' : 'email@gmail.com',
      'password' : 'password'
    };
      when(mockHttpClient.post(any,  body: body, headers: anyNamed('headers')))
          .thenAnswer((_) async => http.Response(json.encode({'access_token': testToken}), 201));
  
      // act
      final result = await dataSource.login(testLoginParams);

      // assert
      expect(result, equals(testToken));
      verify(mockHttpClient.post(testUrl, headers: headers, body: body));
    });


    test('should throw UnauthorizedException when the response code is 401', () async {
      // arrange
      when(mockHttpClient.post(testUrl, headers: headers, body: body))
          .thenAnswer((_) async => http.Response('Unauthorized', 401));

      // act
      final call = dataSource.login;

      // assert
      expect(() => call(testLoginParams), throwsA(isA<UnauthorizedException>()));
      verify(mockHttpClient.post(testUrl, headers: headers, body: body));
    });

    test('should throw ServerException when the response code is not 201 or 401', () async {
      // arrange
      when(mockHttpClient.post(testUrl, headers: headers, body: body))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // act
      final call = dataSource.login;

      // assert
      expect(() => call(testLoginParams), throwsA(isA<ServerException>()));
      verify(mockHttpClient.post(testUrl, headers: headers, body: body));
    });
  });

  group('signUp', () {
    final testSignUpParams = SignUpParams(email: 'test@example.com', password: 'password', name: 'Test User');
    final testUrl = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/auth/register');
    final headers = {'Content-Type': 'application/json'};
    final body = json.encode({'email': 'test@example.com', 'password': 'password', 'name': 'Test User'});

    test('should return unit when the response code is 201 (success)', () async {
      // arrange
      when(mockHttpClient.post(testUrl, headers: headers, body: body))
          .thenAnswer((_) async => http.Response('', 201));

      // act
      final result = await dataSource.signUp(testSignUpParams);

      // assert
      expect(result, equals(unit));
      verify(mockHttpClient.post(testUrl, headers: headers, body: body));
    });

    test('should throw ServerException when the response code is not 201', () async {
      // arrange
      when(mockHttpClient.post(testUrl, headers: headers, body: body))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // act
      final call = dataSource.signUp;

      // assert
      expect(() => call(testSignUpParams), throwsA(isA<ServerException>()));
      verify(mockHttpClient.post(testUrl, headers: headers, body: body));
    });
  });

  group('getMe', () {
    final testUserModel = UserModel(id: '1', name: 'John Doe', email: 'john.doe@example.com');
    final testUrl = Uri.parse('https://g5-flutter-learning-path-be.onrender.com/api/v2/users/me');
    final headers = {'Content-Type': 'application/json'};
    final userJson = json.encode({'data': {'id': '1', 'name': 'John Doe', 'email': 'john.doe@example.com'}});
    const testToken = 'test_token';

    test('should return UserModel when the response code is 200 (success)', () async {
      // arrange
      when(mockHttpClient.get(testUrl, headers: headers))
          .thenAnswer((_) async => http.Response(userJson, 200));

      // act
      final result = await dataSource.getMe(GetMeParams(token: testToken));

      // assert
      expect(result, equals(testUserModel));
      verify(mockHttpClient.get(testUrl, headers: headers));
    });

    test('should throw ServerException when the response code is not 200', () async {
      // arrange
      when(mockHttpClient.get(testUrl, headers: headers))
          .thenAnswer((_) async => http.Response('Server Error', 500));

      // act
      final call = dataSource.getMe;

      // assert
      expect(() => call(GetMeParams(token: testToken)), throwsA(isA<ServerException>()));
      verify(mockHttpClient.get(testUrl, headers: headers));
    });
  });
}
