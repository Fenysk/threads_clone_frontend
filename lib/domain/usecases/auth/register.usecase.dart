import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/data/dto/register.request.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterUsecase implements Usecase<Either, RegisterRequest> {
  @override
  Future<Either> call({
    RegisterRequest? request,
  }) async {
    return serviceLocator<AuthRepository>().register(request!);
  }
}