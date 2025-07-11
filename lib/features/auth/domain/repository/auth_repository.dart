import 'package:authh/core/exceptions/exceptions.dart';
import 'package:dartz/dartz.dart';


abstract class AuthRepository{

  Future<Either<ServerException,Unit>> register(
  String name,
  String email,
  String password,
  String rePassword,
  String phone
      );

  Future<Either<ServerException,Unit>> login(String email, String password);
}