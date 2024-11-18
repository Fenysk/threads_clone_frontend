import 'package:threads_clone/1_domain/entities/posts/post.entity.dart';

abstract class TimelineState {}

class TimelineInitialState extends TimelineState {}

class TimelineLoadingState extends TimelineState {}

class TimelineSuccessState extends TimelineState {
  final List<PostEntity> posts;

  TimelineSuccessState({required this.posts});
}

class TimelineFailureState extends TimelineState {
  final String errorMessage;

  TimelineFailureState({required this.errorMessage});
}
