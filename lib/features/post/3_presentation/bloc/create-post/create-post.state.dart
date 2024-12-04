part of 'create-post.cubit.dart';

sealed class CreatePostState extends Equatable {
  const CreatePostState();

  @override
  List<Object> get props => [];
}

final class CreatePostInitialState extends CreatePostState {}

final class CreatePostLoadingState extends CreatePostState {}

final class CreatePostLoadedState extends CreatePostState {
  final UserEntity currentUser;

  const CreatePostLoadedState({required this.currentUser});

  @override
  List<Object> get props => [
        currentUser
      ];
}

final class CreatePostFailureState extends CreatePostState {
  final String errorMessage;

  const CreatePostFailureState({required this.errorMessage});

  @override
  List<Object> get props => [
        errorMessage
      ];
}
