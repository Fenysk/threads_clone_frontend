import 'package:dartz/dartz.dart';
import 'package:threads_clone/data/models/register.request.dart';
import 'package:threads_clone/data/source/auth.api-service.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> register(RegisterRequest registerRequest) async {
    return serviceLocator<AuthApiService>().register(registerRequest);
  }

  @override
  Future<Either> login() {
    // TODO: implement login
    throw UnimplementedError();
  }
}
