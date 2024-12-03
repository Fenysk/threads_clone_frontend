import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/post/2_domain/usecase/like-post.usecase.dart';
import 'package:threads_clone/features/post/2_domain/usecase/unlike-post.usecase.dart';
import 'package:threads_clone/service_locator.dart';
part 'like.state.dart';

class LikeButtonCubit extends Cubit<LikeButtonState> {
  final PostEntity post;

  LikeButtonCubit({required this.post}) : super(LikeInitialState(likeCount: post.count.Likes));

  void likePost() async {
    final response = await serviceLocator<LikePostUsecase>().execute(request: post.id);

    response.fold(
      (error) => emit(LikeFailureState(errorMessage: error)),
      (_) => emit(LikedState(likeCount: post.count.Likes + 1)),
    );
  }

  void unlikePost() async {
    final response = await serviceLocator<UnlikePostUsecase>().execute(request: post.id);

    response.fold(
      (error) => emit(LikeFailureState(errorMessage: error)),
      (_) => emit(
        UnlikedState(likeCount: post.count.Likes),
      ),
    );
  }
}
