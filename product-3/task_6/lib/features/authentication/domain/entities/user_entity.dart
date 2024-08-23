import 'package:equatable/equatable.dart';

class UserEntity extends Equatable{
  final String id, name, email;

  UserEntity({required this.id, required this.name, required this.email});
  
  @override
  // TODO: implement props
  List<Object> get props => [id, name, email];
}