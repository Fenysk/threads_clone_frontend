import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/timeline/timeline.state.dart';
import 'package:threads_clone/0_data/dto/pagination.request.dart';
import 'package:threads_clone/1_domain/usecases/timeline/get-for-you-timeline.usecase.dart';
import 'package:threads_clone/service_locator.dart';

class TimelineStateCubit extends Cubit<TimelineState> {
  TimelineStateCubit() : super(TimelineInitialState());

  void getForYouTimeline({required PaginationRequest request}) async {
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
