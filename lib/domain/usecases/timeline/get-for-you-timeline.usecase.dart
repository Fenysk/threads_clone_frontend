import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/data/dto/pagination.request.dart';
import 'package:threads_clone/domain/repository/timeline.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetForYouTimelineUsecase implements Usecase<Either, PaginationRequest> {
  @override
  Future<Either> call({
    PaginationRequest? request,
  }) async {
    return serviceLocator<TimelineRepository>().getForYouTimeline(request!);
  }
}
