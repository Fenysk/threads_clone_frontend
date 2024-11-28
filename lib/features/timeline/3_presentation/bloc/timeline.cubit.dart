import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.state.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/timeline/2_domain/usecase/get-for-you-timeline.usecase.dart';
import 'package:threads_clone/service_locator.dart';

class TimelineCubit extends Cubit<TimelineState> {
  TimelineCubit() : super(TimelineInitialState());

  void fetchForYouTimeline({required PaginationRequest request}) async {
    emit(TimelineLoadingState());

    try {
      Either result = await serviceLocator<GetForYouTimelineUsecase>().execute(request: request);

      result.fold(
        (error) => emit(TimelineFailureState(errorMessage: error)),
        (data) => emit(TimelineSuccessState(posts: data)),
      );
    } catch (error) {
      emit(TimelineFailureState(errorMessage: error.toString()));
    }
  }
}
