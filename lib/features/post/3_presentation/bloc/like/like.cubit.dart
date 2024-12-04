import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/post/2_domain/usecase/like-post.usecase.dart';
import 'package:threads_clone/features/post/2_domain/usecase/unlike-post.usecase.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/service_locator.dart';
part 'like.state.dart';

class LikeButtonCubit extends Cubit<LikeButtonState> {
  final PostEntity post;

  LikeButtonCubit({required this.post}) : super(LikeInitialState(likeCount: post.count.Likes));

  void checkIfLiked() async {
    emit(const LikeLoadingState());

    if (post.enriched.isLiked) {
      emit(LikedState(likeCount: post.count.Likes));
    } else {
      emit(UnlikedState(likeCount: post.count.Likes));
    }
  }

  void likePost() async {
    emit(const LikeLoadingState());
    final response = await serviceLocator<LikePostUsecase>().execute(request: post);

    response.fold(
      (error) => emit(LikeFailureState(errorMessage: error)),
      (_) {
        final updatedPost = serviceLocator<TimelineTemporaryService>().getPostById(post.id);

        if (updatedPost == null) return emit(const LikeFailureState(errorMessage: 'Failed to update post like count.'));

        emit(LikedState(likeCount: updatedPost.count.Likes));
      },
    );
  }

  void unlikePost() async {
    emit(const LikeLoadingState());
    final response = await serviceLocator<UnlikePostUsecase>().execute(request: post);

    response.fold(
      (error) => emit(LikeFailureState(errorMessage: error)),
      (_) {
        final updatedPost = serviceLocator<TimelineTemporaryService>().getPostById(post.id);

        if (updatedPost == null) return emit(const LikeFailureState(errorMessage: 'Failed to update post like count.'));

        emit(UnlikedState(likeCount: updatedPost.count.Likes));
      },
    );
  }
}
