import 'package:get_it/get_it.dart';
import 'package:threads_clone/3_presentation/core/network/dio_client.dart';
import 'package:threads_clone/0_data/repository/auth.repository-impl.dart';
import 'package:threads_clone/0_data/repository/posts.repository-impl.dart';
import 'package:threads_clone/0_data/repository/timeline.repository.dart';
import 'package:threads_clone/0_data/source/auth/auth-api.service.dart';
import 'package:threads_clone/0_data/source/auth/auth-local.service.dart';
import 'package:threads_clone/0_data/source/posts/posts-api.service.dart';
import 'package:threads_clone/0_data/source/timeline/timeline-api.service.dart';
import 'package:threads_clone/1_domain/repository/auth.repository.dart';
import 'package:threads_clone/1_domain/repository/posts.repository.dart';
import 'package:threads_clone/1_domain/repository/timeline.repository.dart';
import 'package:threads_clone/1_domain/usecases/auth/get-my-profile.usecase.dart';
import 'package:threads_clone/1_domain/usecases/auth/is_loggin_in.usercase.dart';
import 'package:threads_clone/1_domain/usecases/auth/login.usecase.dart';
import 'package:threads_clone/1_domain/usecases/auth/logout.usecase.dart';
import 'package:threads_clone/1_domain/usecases/auth/register.usecase.dart';
import 'package:threads_clone/1_domain/usecases/timeline/get-for-you-timeline.usecase.dart';
import 'package:threads_clone/1_domain/usecases/posts/like-post.usecase.dart';

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
  // Posts
  serviceLocator.registerSingleton<PostsApiService>(PostsApiServiceImpl());

  //// Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<TimelineRepository>(TimelineRepositoryImpl());
  serviceLocator.registerSingleton<PostsRepository>(PostsRepositoryImpl());
  //// Usecases
  // Auth
  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetMyProfileUsecase>(GetMyProfileUsecase());
  serviceLocator.registerSingleton<LogoutUsecase>(LogoutUsecase());
  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());
  // Timeline
  serviceLocator.registerSingleton<GetForYouTimelineUsecase>(GetForYouTimelineUsecase());
  // Posts
  serviceLocator.registerSingleton<LikePostUsecase>(LikePostUsecase());
}
