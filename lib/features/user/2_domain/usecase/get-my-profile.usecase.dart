import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/user/2_domain/repository/users.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetMyProfileUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> execute({
    dynamic request,
  }) async {
    return serviceLocator<UsersRepository>().getMyProfile();
  }
}
