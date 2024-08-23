part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

class LoginEvent extends AuthEvent{
  final String email, password;

  LoginEvent({required this.email, required this.password});
}

class LogoutEvent extends AuthEvent{}

class SignUpEvent extends AuthEvent{
  final String name, email, password;

  SignUpEvent({required this.name, required this.email, required this.password});

}
