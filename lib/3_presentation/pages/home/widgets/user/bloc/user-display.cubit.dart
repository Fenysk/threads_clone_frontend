import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/1_domain/usecases/users/get-my-profile.usecase.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/user/bloc/user-display.state.dart';
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
