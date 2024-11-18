import 'package:get_it/get_it.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/data/repository/auth.repository-impl.dart';
import 'package:threads_clone/data/repository/timeline.repository.dart';
import 'package:threads_clone/data/source/auth/auth-api.service.dart';
import 'package:threads_clone/data/source/auth/auth-local.service.dart';
import 'package:threads_clone/data/source/timeline/timeline-api.service.dart';
import 'package:threads_clone/domain/repository/auth.repository.dart';
import 'package:threads_clone/domain/repository/timeline.repository.dart';
import 'package:threads_clone/domain/usecases/auth/get-my-profile.usecase.dart';
import 'package:threads_clone/domain/usecases/auth/is_loggin_in.usercase.dart';
import 'package:threads_clone/domain/usecases/auth/login.usecase.dart';
import 'package:threads_clone/domain/usecases/auth/logout.usecase.dart';
import 'package:threads_clone/domain/usecases/auth/register.usecase.dart';
import 'package:threads_clone/domain/usecases/timeline/get-for-you-timeline.usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //// Network
  serviceLocator.registerSingleton<DioClient>(DioClient());

  //// Services
  // Auth
  serviceLocator.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  serviceLocator.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  // Timeline
  serviceLocator.registerSingleton<TimelineApiService>(TimelineApiServiceImpl());

  //// Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<TimelineRepository>(TimelineRepositoryImpl());

  //// Usecases
  // Auth
  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetMyProfileUsecase>(GetMyProfileUsecase());
  serviceLocator.registerSingleton<LogoutUsecase>(LogoutUsecase());
  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());
  // Timeline
  serviceLocator.registerSingleton<GetForYouTimelineUsecase>(GetForYouTimelineUsecase());
}
