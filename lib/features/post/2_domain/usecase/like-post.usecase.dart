import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/post/2_domain/repository/posts.repository.dart';
import 'package:threads_clone/service_locator.dart';

class LikePostUsecase implements Usecase<Either, String> {
  @override
  Future<Either> execute({
    String? request,
  }) async {
    return serviceLocator<PostsRepository>().likePost(request!);
  }
}
