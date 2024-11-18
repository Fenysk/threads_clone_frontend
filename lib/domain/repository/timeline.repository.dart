import 'package:dartz/dartz.dart';
import 'package:threads_clone/data/dto/pagination.request.dart';

abstract class TimelineRepository {
  Future<Either> getForYouTimeline(PaginationRequest paginationRequest);
}
