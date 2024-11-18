import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/pages/auth/bloc/auth.state.dart';
import 'package:threads_clone/1_domain/usecases/auth/is_loggin_in.usercase.dart';
import 'package:threads_clone/service_locator.dart';

class AuthStateCubit extends Cubit<AuthState> {
  AuthStateCubit() : super(AppInitialState());

  void appStarted() async {
    final isLoggedIn = await serviceLocator<IsLoggedInUsecase>().execute();

    if (isLoggedIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }
}
