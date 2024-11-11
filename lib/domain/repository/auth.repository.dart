import 'package:dartz/dartz.dart';
import 'package:threads_clone/data/models/register.request.dart';

abstract class AuthRepository {
  Future<Either> register(RegisterRequest registerRequest);

  Future<Either> login();
}
