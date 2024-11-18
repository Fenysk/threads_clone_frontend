import 'package:dartz/dartz.dart';
import 'package:threads_clone/3_presentation/core/usecase/usecase.dart';
import 'package:threads_clone/0_data/dto/login.request.dart';
import 'package:threads_clone/1_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class LoginUsecase implements Usecase<Either, LoginRequest> {
  @override
  Future<Either> execute({
    LoginRequest? request,
  }) async {
    return serviceLocator<AuthRepository>().login(request!);
  }
}
