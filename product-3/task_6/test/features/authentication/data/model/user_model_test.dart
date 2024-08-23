import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/features/authentication/data/model/user_model.dart';


void main() {
  final testUserModel = UserModel(id: '1', name: 'John Doe', email: 'john.doe@example.com');

  group('UserModel', () {
    test('should correctly convert from JSON', () {
      // arrange
      final jsonMap = {
        'id': '1',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
      };

      // act
      final result = UserModel.fromJson(jsonMap);

      // assert
      expect(result, testUserModel);
    });

    test('should correctly convert to JSON', () {
      // act
      final result = testUserModel.toJson();

      // assert
      final expectedJsonMap = {
        'id': '1',
        'name': 'John Doe',
        'email': 'john.doe@example.com',
      };

      expect(result, expectedJsonMap);
    });
  });
}
