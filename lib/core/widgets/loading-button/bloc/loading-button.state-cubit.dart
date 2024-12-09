import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state.dart';
import 'package:threads_clone/core/usecase/usecase.dart';

class LoadingButtonStateCubit extends Cubit<LoadingButtonState> {
  LoadingButtonStateCubit() : super(LoadingButtonInitialState());

  void execute({dynamic params, required Usecase usecase}) async {
    emit(LoadingButtonLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    try {
      Either result = await usecase.execute(request: params);

      result.fold(
        (error) => emit(LoadingButtonFailureState(errorMessage: error)),
        (data) => emit(LoadingButtonSuccessState()),
      );
    } catch (error) {
      emit(LoadingButtonFailureState(errorMessage: error.toString()));
    }
  }
}
