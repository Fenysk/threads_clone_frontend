import 'package:equatable/equatable.dart';

abstract class TimelineState extends Equatable {
  @override
  List<Object?> get props => [];
}

class TimelineInitialState extends TimelineState {}

class TimelineLoadingState extends TimelineState {}

class TimelineSuccessState extends TimelineState {}

class TimelineFailureState extends TimelineState {
  final String errorMessage;

  TimelineFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [
        errorMessage
      ];
}
