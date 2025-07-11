import 'package:dartz/dartz.dart';

abstract class AuthRemoteDataSource{
  
  Future<Unit> register(
      String name,
      String email,
      String password,
      String rePassword,
      String phone
      );

  Future<Unit> login(String email, String password);
}