import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/button/bloc/button.state.dart';
import 'package:threads_clone/core/usecase/usecase.dart';

class ButtonStateCubit extends Cubit<ButtonState> {
  ButtonStateCubit() : super(ButtonInitialState());

  void execute({dynamic params, required Usecase usecase}) async {
    emit(ButtonLoadingState());

    await Future.delayed(const Duration(seconds: 2));

    try {
      Either result = await usecase.execute(request: params);

      result.fold(
        (error) => emit(ButtonFailureState(errorMessage: error)),
        (data) => emit(ButtonSuccessState()),
      );
    } catch (error) {
      emit(ButtonFailureState(errorMessage: error.toString()));
    }
  }
}
