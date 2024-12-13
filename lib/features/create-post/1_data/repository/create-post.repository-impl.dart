import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/features/create-post/1_data/dto/create-post.request.dart';
import 'package:threads_clone/features/create-post/1_data/source/create-post-local.service.dart';
import 'package:threads_clone/features/post/2_domain/enum/create-post-visibility.enum.dart';
import 'package:threads_clone/features/create-post/2_domain/repository/create-post.repository.dart';
import 'package:threads_clone/features/post/1_data/model/post.model.dart';
import 'package:threads_clone/features/post/1_data/source/posts-api.service.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/service_locator.dart';

class CreatePostRepositoryImpl extends CreatePostRepository {
  @override
  VisibilityEnum changePostVisility(String visibility) {
    VisibilityEnum visibilityEnum = serviceLocator<CreatePostLocalService>().changePostVisibility(visibility);

    return visibilityEnum;
  }

  @override
  Future<Either> createNewPost() async {
    CreatePostRequest? newPost = serviceLocator<CreatePostLocalService>().newEditingPost;

    if (newPost == null) return const Left('New post doesn\'t exist');

    final result = await serviceLocator<PostsApiService>().createNewPost(newPost);

    return result.fold(
      (error) {
        return Left(error);
      },
      (data) {
        Response response = data;

        PostModel newPost = PostModel.fromMap(response.data);

        serviceLocator<TimelineTemporaryService>().addPostsInTimeline([
          newPost.toEntity()
        ]);

        return Right(data);
      },
    );
  }
}
