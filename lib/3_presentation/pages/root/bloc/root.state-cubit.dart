import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/1_domain/usecases/auth/is_loggin_in.usercase.dart';
import 'package:threads_clone/3_presentation/pages/root/bloc/root.state.dart';
import 'package:threads_clone/service_locator.dart';

class RootStateCubit extends Cubit<RootState> {
  RootStateCubit() : super(RootInitialState());

  void appStarted() async {
    final isLoggedIn = await serviceLocator<IsLoggedInUsecase>().execute();

    if (isLoggedIn) {
      emit(RootAuthenticatedState());
    } else {
      emit(RootUnauthenticatedState());
    }
  }
}
