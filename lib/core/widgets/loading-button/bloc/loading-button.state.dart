abstract class LoadingButtonState {}

class LoadingButtonInitialState extends LoadingButtonState {}

class LoadingButtonLoadingState extends LoadingButtonState {}

class LoadingButtonSuccessState extends LoadingButtonState {}

class LoadingButtonFailureState extends LoadingButtonState {
  final String errorMessage;

  LoadingButtonFailureState({required this.errorMessage});
}
