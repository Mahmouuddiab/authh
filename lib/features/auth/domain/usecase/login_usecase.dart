import 'package:authh/core/exceptions/exceptions.dart';
import 'package:authh/features/auth/domain/repository/auth_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@injectable
class LoginUseCase{
  AuthRepository authRepository;
  LoginUseCase({required this.authRepository});
  Future<Either<ServerException,Unit>> call(String email,String password)async{
    try{
      var result= await authRepository.login(email, password);
      return result ;
    }catch(e){
      return Left(ServerException(e.toString()));
    }
  }
}