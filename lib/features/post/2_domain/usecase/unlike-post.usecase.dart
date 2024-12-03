import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/post/2_domain/repository/posts.repository.dart';
import 'package:threads_clone/service_locator.dart';

class UnlikePostUsecase implements Usecase<Either, PostEntity> {
  @override
  Future<Either> execute({
    PostEntity? request,
  }) async {
    return serviceLocator<PostsRepository>().unlikePost(request!);
  }
}
