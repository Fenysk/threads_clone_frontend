import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state-cubit.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state.dart';
import 'package:threads_clone/features/auth/3_presentation/page/auth.page.dart';
import 'package:threads_clone/features/auth/3_presentation/widget/logout-button.widget.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.cubit.dart';
import 'package:threads_clone/features/user/3_presentation/widget/user-display.widget.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => LoadingButtonCubit()),
        BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
      ],
      child: BlocListener<LoadingButtonCubit, LoadingButtonState>(
        listener: (context, state) {
          if (state is LoadingButtonSuccessState) {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const AuthPage()));
          }
        },
        child: const Column(
          children: [
            UserDisplayWidget(),
            LogoutButton(),
          ],
        ),
      ),
    );
  }
}
