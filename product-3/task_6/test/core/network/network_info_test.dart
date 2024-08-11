import 'package:flutter_test/flutter_test.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mockito/mockito.dart';
import 'package:task_6/core/network/network_info.dart';

import '../../helpers/test_helper.mocks.dart';




void main(){
  late NetworkInfoImpl networkInfoImpl;
  late MockInternetConnectionChecker mockInternetConnectionChecker;

  setUp((){
    mockInternetConnectionChecker = MockInternetConnectionChecker();
    networkInfoImpl = NetworkInfoImpl(internetConnectionChecker:  mockInternetConnectionChecker);
    
  });

  group('NetworkInfoImpl - isConnected', () {
    test('should forward the call to InternetConnectionChecker.hasConnection', () async {
      when(mockInternetConnectionChecker.hasConnection).thenAnswer((_) async => true);

      final result = await networkInfoImpl.isConnected;

      verify(mockInternetConnectionChecker.hasConnection);
      expect(result, true);
    });
  });

  }