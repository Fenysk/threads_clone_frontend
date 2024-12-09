import 'package:get_it/get_it.dart';
import 'package:threads_clone/features/post/2_domain/usecase/unlike-post.usecase.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/features/user/1_data/repository/users.repository-impl.dart';
import 'package:threads_clone/features/user/1_data/source/user-local.service.dart';
import 'package:threads_clone/features/user/1_data/source/users-api.service.dart';
import 'package:threads_clone/features/user/2_domain/repository/users.repository.dart';
import 'package:threads_clone/core/network/dio_client.dart';
import 'package:threads_clone/features/auth/1_data/repository/auth.repository-impl.dart';
import 'package:threads_clone/features/post/1_data/repository/posts.repository-impl.dart';
import 'package:threads_clone/features/timeline/1_data/repository/timeline.repository-impl.dart';
import 'package:threads_clone/features/auth/1_data/source/auth-api.service.dart';
import 'package:threads_clone/features/auth/1_data/source/auth-local.service.dart';
import 'package:threads_clone/features/post/1_data/source/posts-api.service.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-api.service.dart';
import 'package:threads_clone/features/auth/2_domain/repository/auth.repository.dart';
import 'package:threads_clone/features/post/2_domain/repository/posts.repository.dart';
import 'package:threads_clone/features/timeline/2_domain/repository/timeline.repository.dart';
import 'package:threads_clone/features/user/2_domain/usecase/get-my-profile.usecase.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/is_loggin_in.usercase.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/login.usecase.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/logout.usecase.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/register.usecase.dart';
import 'package:threads_clone/features/timeline/2_domain/usecase/get-for-you-timeline.usecase.dart';
import 'package:threads_clone/features/post/2_domain/usecase/like-post.usecase.dart';
import 'package:threads_clone/features/user/2_domain/usecase/load-my-user-profile.usecase.dart';

final serviceLocator = GetIt.instance;

void setupServiceLocator() {
  //// Network
  serviceLocator.registerSingleton<DioClient>(DioClient());

  //// Services
  serviceLocator.registerSingleton<AuthApiService>(AuthApiServiceImpl());
  serviceLocator.registerSingleton<AuthLocalService>(AuthLocalServiceImpl());
  serviceLocator.registerSingleton<UsersApiService>(UsersApiServiceImpl());
  serviceLocator.registerSingleton<UserLocalService>(UserLocalServiceImpl());
  serviceLocator.registerSingleton<TimelineApiService>(TimelineApiServiceImpl());
  serviceLocator.registerSingleton<TimelineTemporaryService>(TimelineTemporaryServiceImpl());
  serviceLocator.registerSingleton<PostsApiService>(PostsApiServiceImpl());

  //// Repositories
  serviceLocator.registerSingleton<AuthRepository>(AuthRepositoryImpl());
  serviceLocator.registerSingleton<TimelineRepository>(TimelineRepositoryImpl());
  serviceLocator.registerSingleton<PostsRepository>(PostsRepositoryImpl());
  serviceLocator.registerSingleton<UsersRepository>(UsersRepositoryImpl());

  //// Usecases
  serviceLocator.registerSingleton<RegisterUsecase>(RegisterUsecase());
  serviceLocator.registerSingleton<IsLoggedInUsecase>(IsLoggedInUsecase());
  serviceLocator.registerSingleton<GetMyProfileUsecase>(GetMyProfileUsecase());
  serviceLocator.registerSingleton<LoadMyUserProfileUsecase>(LoadMyUserProfileUsecase());
  serviceLocator.registerSingleton<LogoutUsecase>(LogoutUsecase());
  serviceLocator.registerSingleton<LoginUsecase>(LoginUsecase());
  serviceLocator.registerSingleton<GetForYouTimelineUsecase>(GetForYouTimelineUsecase());
  serviceLocator.registerSingleton<LikePostUsecase>(LikePostUsecase());
  serviceLocator.registerSingleton<UnlikePostUsecase>(UnlikePostUsecase());
}
