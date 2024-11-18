import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetMyProfileUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({
    dynamic request,
  }) async {
    return serviceLocator<AuthRepository>().getMyProfile();
  }
}
