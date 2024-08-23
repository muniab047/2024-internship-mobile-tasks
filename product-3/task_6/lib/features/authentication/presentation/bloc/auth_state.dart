part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}

class AuthAuthenticated extends AuthState {
  final UserEntity user ;

  AuthAuthenticated({required this.user});
}
class AuthUnAuthenticated extends AuthState {}


class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});
}

class AuthSuccess extends AuthState{
  final String message;

  AuthSuccess({required this.message});

}

class AuthLoggedOut extends AuthState {}
