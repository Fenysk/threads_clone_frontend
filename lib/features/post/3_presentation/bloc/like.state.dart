part of 'like.cubit.dart';

abstract class LikeButtonState extends Equatable {
  const LikeButtonState();

  @override
  List<Object> get props => [];
}

final class LikeInitialState extends LikeButtonState {
  final int likeCount;

  const LikeInitialState({required this.likeCount});

  @override
  List<Object> get props => [
        likeCount
      ];
}

final class LikedState extends LikeButtonState {
  final int likeCount;

  const LikedState({required this.likeCount});

  @override
  List<Object> get props => [
        likeCount
      ];
}

final class UnlikedState extends LikeButtonState {
  final int likeCount;

  const UnlikedState({required this.likeCount});

  @override
  List<Object> get props => [
        likeCount
      ];
}

final class LikeFailureState extends LikeButtonState {
  final String errorMessage;

  const LikeFailureState({required this.errorMessage});

  @override
  List<Object> get props => [
        errorMessage
      ];
}
