import 'package:authh/features/auth/domain/usecase/login_usecase.dart';
import 'package:authh/features/auth/domain/usecase/register_usecase.dart';
import 'package:authh/features/auth/presenation/bloc/auth_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AuthCubit extends Cubit<AuthStates>{
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  AuthCubit(this.loginUseCase,this.registerUseCase):super(AuthInitialState());

  Future<void> login(String email,String password)async{
    emit(LoginLoadingState());
    var response= await loginUseCase.call(email, password);
    return response.fold(
        (l) {
          emit(LoginErrorState(l.message));
        },
        (r) {
          emit(LoginSuccessState());
        },
    ) ;
  }

  Future<void> register(String name,String email,String password,String rePassword,String phone)async{
    emit(RegisterLoadingState());
    var response =await registerUseCase.call(name, email, password, rePassword, phone);
    return response.fold(
        (l) {
          emit(RegisterErrorState(l.message));
        },
        (r) {
          emit(RegisterSuccessState());
        },
    ) ;
  }
}