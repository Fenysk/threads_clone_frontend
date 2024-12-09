import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';
import 'package:threads_clone/features/user/2_domain/usecase/load-my-user-profile.usecase.dart';
import 'package:threads_clone/service_locator.dart';
part 'create-post.state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  CreatePostCubit() : super(CreatePostInitialState());

  void loadCurrentUser() async {
    emit(CreatePostLoadingState());

    final result = await serviceLocator<LoadMyUserProfileUsecase>().execute();

    result.fold(
      (error) => emit(CreatePostFailureState(errorMessage: error.toString())),
      (currentUser) => emit(CreatePostLoadedState(currentUser: currentUser)),
    );
  }
}
