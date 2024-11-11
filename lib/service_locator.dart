import 'package:get_it/get_it.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/data/repository/auth.repository-impl.dart';
import 'package:threads_clone/data/source/auth.api-service.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/domain/usecases/register.usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Network
  serviceLocator.registerSingleton<DioClient>(
    DioClient(),
  );

  // Services
  serviceLocator.registerSingleton<AuthApiService>(
    AuthApiServiceImpl(),
  );

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(
    AuthRepositoryImpl(),
  );

  // Usecases
  serviceLocator.registerSingleton<RegisterUsecase>(
    RegisterUsecase(),
  );
}
