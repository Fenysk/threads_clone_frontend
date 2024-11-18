import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/0_data/source/posts/posts-api.service.dart';
import 'package:threads_clone/1_domain/repository/posts.repository.dart';
import 'package:threads_clone/service_locator.dart';

class PostsRepositoryImpl extends PostsRepository {
  @override
  Future<Either> likePost(String postId) async {
    Either result = await serviceLocator<PostsApiService>().likePost(postId);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        return Right(response);
      },
    );
  }
}
