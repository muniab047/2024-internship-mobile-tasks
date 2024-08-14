import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:task_6/core/util/input_converter.dart';

void main(){
  late InputConverter inputConverter;

  setUp((){
    inputConverter = InputConverter();
  });

  group('StringToUnsignedInt', (){
    test('should return an integer when the string represents an unsigned integer',()async{
      final str = '123';
      final result = inputConverter.stringToUnsignedInteger(str);

      expect(result, Right(123));
    });

     test('should return Failure when the string represents ',()async{
      final str = '1.0';
      final result = inputConverter.stringToUnsignedInteger(str);

      expect(result, Left(InvalidInputFailure()));
    });

     

  });

}