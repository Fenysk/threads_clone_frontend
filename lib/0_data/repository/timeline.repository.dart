import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/0_data/dto/pagination.request.dart';
import 'package:threads_clone/0_data/models/post/post.model.dart';
import 'package:threads_clone/0_data/source/timeline/timeline-api.service.dart';
import 'package:threads_clone/1_domain/entities/posts/post.entity.dart';
import 'package:threads_clone/1_domain/repository/timeline.repository.dart';
import 'package:threads_clone/service_locator.dart';

class TimelineRepositoryImpl extends TimelineRepository {
  @override
  Future<Either> getForYouTimeline(PaginationRequest paginationRequest) async {
    Either result = await serviceLocator<TimelineApiService>().getForYouTimeline(paginationRequest);

    return result.fold(
      (error) => Left(error),
      (data) async {
        Response response = data;

        List<PostModel> postModels = PostModel.parsePostsFromResponse(response.data);
        List<PostEntity> postEntities = PostModel.toListEntity(postModels);

        return Right(postEntities);
      },
    );
  }
}
