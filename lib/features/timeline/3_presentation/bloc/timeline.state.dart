import 'package:equatable/equatable.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';

abstract class TimelineState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimelineInitialState extends TimelineState {}

class TimelineLoadingState extends TimelineState {}

class TimelineSuccessState extends TimelineState {
  final List<PostEntity> posts;

  TimelineSuccessState({required this.posts});

  @override
  List<Object?> get props => [
        posts
      ];
}

class TimelineFailureState extends TimelineState {
  final String errorMessage;

  TimelineFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage
      ];
}
