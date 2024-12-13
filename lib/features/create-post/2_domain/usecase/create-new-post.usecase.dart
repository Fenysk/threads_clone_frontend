import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/create-post/2_domain/repository/create-post.repository.dart';
import 'package:threads_clone/service_locator.dart';

class CreateNewPostUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> execute({
    dynamic request,
  }) async {
    return serviceLocator<CreatePostRepository>().createNewPost();
  }
}
