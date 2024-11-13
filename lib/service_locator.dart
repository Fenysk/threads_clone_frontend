import 'package:get_it/get_it.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/data/repository/auth.repository-impl.dart';
import 'package:threads_clone/data/source/auth/auth-api.service.dart';
import 'package:threads_clone/data/source/auth/auth-local.service.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/domain/usecases/get-my-profile.usecase.dart';
import 'package:threads_clone/domain/usecases/is_loggin_in.usercase.dart';
import 'package:threads_clone/domain/usecases/login.usecase.dart';
import 'package:threads_clone/domain/usecases/logout.usecase.dart';
import 'package:threads_clone/domain/usecases/register.usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  // Network
  serviceLocator.registerSingleton<DioClient>(DioClient());

  // Services
  serviceLocator.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  serviceLocator.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());

  // Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  // Usecases
  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetMyProfileUsecase>(GetMyProfileUsecase());
  serviceLocator.registerSingleton<LogoutUsecase>(LogoutUsecase());
  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());
}
