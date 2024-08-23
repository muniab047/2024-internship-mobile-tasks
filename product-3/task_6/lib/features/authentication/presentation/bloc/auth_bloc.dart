import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/params/auth_params.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/use cases/login.dart';
import '../../domain/use cases/logout.dart';
import '../../domain/use cases/sign_up.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final Login login;
  final Logout logout;
  final SignUp signUp;

  AuthBloc({required this.login, required this.logout, required this.signUp}) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) {
      // TODO: implement event handler
    });

    on<LoginEvent>((event, emit)async{
      emit(AuthLoading());
      final loginParams = LoginParams(email: event.email, password: event.password);
      print(state);
      final result = await login.call(loginParams);

      result.fold(
        (failure){
          if (failure is Unauthorized){

          emit(AuthUnAuthenticated());
          }
          else{
            emit(AuthError(message: 'Server Failure'));
          }
        },(data){
          emit(AuthAuthenticated(user: data));

        }
      

      );
      print(state);



    });

    on<LogoutEvent>((event, emit)async{
      emit(AuthLoading());
      await logout.call();
      emit(AuthUnAuthenticated());
      
    });

    on<SignUpEvent>((event, emit)async{
      emit(AuthLoading());
      final SignUpParams signUpParams = SignUpParams(name: event.name, password: event.password, email: event.email);
      final result = await signUp.call(signUpParams);
      result.fold(
        (failure){
          emit(AuthError(message: 'server failure'));
        },
        (data){
          emit(AuthSuccess(message: 'Signed up successfully'));
        }
      );

    });
  }
}
