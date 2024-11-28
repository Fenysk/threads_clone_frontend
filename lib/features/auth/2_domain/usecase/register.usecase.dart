import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/auth/1_data/dto/register.request.dart';
import 'package:threads_clone/features/auth/2_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterUsecase implements Usecase<Either, RegisterRequest> {
  @override
  Future<Either> execute({
    RegisterRequest? request,
  }) async {
    return serviceLocator<AuthRepository>().register(request!);
  }
}
