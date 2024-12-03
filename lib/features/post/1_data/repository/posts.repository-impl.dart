import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/features/post/1_data/source/posts-api.service.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/post/2_domain/repository/posts.repository.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/service_locator.dart';

class PostsRepositoryImpl extends PostsRepository {
  @override
  Future<Either> likePost(PostEntity post) async {
    Either result = await serviceLocator<PostsApiService>().likePost(post.id);

    return result.fold(
      (error) => Left(error),
      (data) async {
        final fetchedPost = serviceLocator<TimelineTemporaryService>().getPostById(post.id);
        final updatedPost = post.copyWith(count: post.count.copyWith(Likes: fetchedPost!.count.Likes + 1));
        serviceLocator<TimelineTemporaryService>().updatePostInTimeline(updatedPost);
        if (data is String) {
          return Right(data);
        }

        Response response = data;
        return Right(response);
      },
    );
  }

  @override
  Future<Either> unlikePost(PostEntity post) async {
    Either result = await serviceLocator<PostsApiService>().unlikePost(post.id);

    return result.fold(
      (error) => Left(error),
      (data) async {
        final fetchedPost = serviceLocator<TimelineTemporaryService>().getPostById(post.id);
        final updatedPost = post.copyWith(count: post.count.copyWith(Likes: fetchedPost!.count.Likes - 1));
        serviceLocator<TimelineTemporaryService>().updatePostInTimeline(updatedPost);

        if (data is String) {
          return Right(data);
        }

        Response response = data;
        return Right(response);
      },
    );
  }
}
