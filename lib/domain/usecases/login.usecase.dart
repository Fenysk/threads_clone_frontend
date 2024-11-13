import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/data/dto/login.request.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class LoginUsecase implements Usecase<Either, LoginRequest> {
  @override
  Future<Either> call({
    LoginRequest? loginRequest,
  }) async {
    return serviceLocator<AuthRepository>().login(loginRequest!);
  }
}
