import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/user/2_domain/usecase/get-my-profile.usecase.dart';
import 'package:threads_clone/features/user/2_domain/usecase/get-user-profile.usecase.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.state.dart';
import 'package:threads_clone/service_locator.dart';

class UserDisplayCubit extends Cubit<UserDisplayState> {
  UserDisplayCubit() : super(UserDisplayLoading());

  void displayUser({String? userId}) async {
    final Either result;

    print('\x1B[31m---- \x1B[0m$userId');

    if (userId == null || userId.isEmpty)
      result = await serviceLocator<GetMyProfileUsecase>().execute();
    else
      result = await serviceLocator<GetUserProfileUsecase>().execute(request: userId);

    result.fold(
      (error) => emit(UserDisplayFailure(errorMessage: error.toString())),
      (user) => emit(UserDisplayLoaded(user: user)),
    );
  }
}
