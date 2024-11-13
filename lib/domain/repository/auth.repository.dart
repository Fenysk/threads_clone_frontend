import 'package:dartz/dartz.dart';
import 'package:threads_clone/data/dto/login.request.dart';
import 'package:threads_clone/data/dto/register.request.dart';

abstract class AuthRepository {
  Future<Either> register(RegisterRequest registerRequest);

  Future<bool> isLoggedIn();

  Future<Either> getMyProfile();

  Future<Either> login(LoginRequest loginRequest);

  Future<Either> logout();
}
