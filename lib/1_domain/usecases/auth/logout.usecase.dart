import 'package:dartz/dartz.dart';
import 'package:threads_clone/3_presentation/core/usecase/usecase.dart';
import 'package:threads_clone/1_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class LogoutUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> execute({
    dynamic request,
  }) async {
    return serviceLocator<AuthRepository>().logout();
  }
}
