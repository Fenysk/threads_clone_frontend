import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/auth/2_domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class IsLoggedInUsecase implements Usecase<bool, dynamic> {
  @override
  Future<bool> execute({
    dynamic request,
  }) async {
    return serviceLocator<AuthRepository>().isLoggedIn();
  }
}
