import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/features/post/1_data/source/posts-api.service.dart';
import 'package:threads_clone/features/post/2_domain/repository/posts.repository.dart';
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

  @override
  Future<Either> unlikePost(String postId) async {
    Either result = await serviceLocator<PostsApiService>().unlikePost(postId);

    return result.fold(
      (error) => Left(error),
      (data) async {
        if (data is String) {
          return Right(data);
        }

        Response response = data;
        return Right(response);
      },
    );
  }
}
