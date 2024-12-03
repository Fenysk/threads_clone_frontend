import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/post/1_data/model/post.model.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-api.service.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/features/timeline/2_domain/repository/timeline.repository.dart';
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

        serviceLocator<TimelineTemporaryService>().addPostsInTimeline(postEntities);

        return Right(postEntities);
      },
    );
  }
}
