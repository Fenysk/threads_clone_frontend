import 'package:dartz/dartz.dart';
import 'package:threads_clone/features/auth/1_data/dto/login.request.dart';
import 'package:threads_clone/features/auth/1_data/dto/register.request.dart';

abstract class AuthRepository {
  Future<Either> register(RegisterRequest registerRequest);

  Future<bool> isLoggedIn();

  Future<Either> login(LoginRequest loginRequest);

  Future<Either> logout();

  Future<Either> refresh();
}
