import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/is_loggin_in.usercase.dart';
import 'package:threads_clone/features/auth/3_presentation/bloc/auth.state.dart';
import 'package:threads_clone/service_locator.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthLoadingState());

  void appStarted() async {
    final isLoggedIn = await serviceLocator<IsLoggedInUsecase>().execute();

    if (isLoggedIn) {
      emit(AuthenticatedState());
    } else {
      emit(UnauthenticatedState());
    }
  }
}
