import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/user/2_domain/usecase/get-my-profile.usecase.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.state.dart';
import 'package:threads_clone/service_locator.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserDisplayLoading());

  void displayUser() async {
    final result = await serviceLocator<GetMyProfileUsecase>().execute();

    result.fold(
      (error) => emit(UserDisplayFailure(errorMessage: error.toString())),
      (user) => emit(UserDisplayLoaded(user: user)),
    );
  }
}
