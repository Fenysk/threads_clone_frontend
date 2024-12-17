import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/user/2_domain/repository/users.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetUserProfileUsecase implements Usecase<Either, String> {
  @override
  Future<Either> execute({
    String? request,
  }) async {
    return serviceLocator<UsersRepository>().getUserProfile(request!);
  }
}
