import 'package:dartz/dartz.dart';
import 'package:threads_clone/3_presentation/core/usecase/usecase.dart';
import 'package:threads_clone/0_data/dto/pagination.request.dart';
import 'package:threads_clone/1_domain/repository/timeline.repository.dart';
import 'package:threads_clone/service_locator.dart';

class GetForYouTimelineUsecase implements Usecase<Either, PaginationRequest> {
  @override
  Future<Either> execute({
    PaginationRequest? request,
  }) async {
    return serviceLocator<TimelineRepository>().getForYouTimeline(request!);
  }
}
