import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/service_locator.dart';

class IsLoggedInUsecase implements Usecase<bool, dynamic> {
  @override
  Future<bool> call({
    dynamic loginRequest,
  }) async {
    return serviceLocator<AuthRepository>().isLoggedIn();
  }
}
