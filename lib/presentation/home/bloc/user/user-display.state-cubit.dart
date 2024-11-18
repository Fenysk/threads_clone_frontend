import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/domain/usecases/auth/get-my-profile.usecase.dart';
import 'package:threads_clone/presentation/home/bloc/user/user-display.state.dart';
import 'package:threads_clone/service_locator.dart';

class UserDisplayStateCubit extends Cubit<UserDisplayState> {
  UserDisplayStateCubit() : super(UserDisplayLoading());

  void displayUser() async {
    final result = await serviceLocator<GetMyProfileUsecase>().call();

    result.fold(
      (error) => emit(UserDisplayFailure(errorMessage: error.toString())),
      (user) => emit(UserDisplayLoaded(user: user)),
    );
  }
}
