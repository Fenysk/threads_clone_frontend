import 'package:dartz/dartz.dart';
import 'package:threads_clone/core/usecase/usecase.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/timeline/2_domain/repository/timeline.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetForYouTimelineUsecase implements Usecase<Either, PaginationRequest> {
  @override
  Future<Either> execute({
    PaginationRequest? request,
  }) async {
    return serviceLocator<TimelineRepository>().getForYouTimeline(request!);
  }
}
