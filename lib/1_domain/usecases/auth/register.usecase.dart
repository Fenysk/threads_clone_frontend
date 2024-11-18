import 'package:dartz/dartz.dart';
import 'package:threads_clone/3_presentation/core/usecase/usecase.dart';
import 'package:threads_clone/0_data/dto/register.request.dart';
import 'package:threads_clone/1_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterUsecase implements Usecase<Either, RegisterRequest> {
  @override
  Future<Either> execute({
    RegisterRequest? request,
  }) async {
    return serviceLocator<AuthRepository>().register(request!);
  }
}
