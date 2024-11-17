import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';
import 'package:threads_clone/common/widgets/custom_button.widget.dart';
import 'package:threads_clone/domain/usecases/logout.usecase.dart';
import 'package:threads_clone/presentation/home/bloc/user-display.state-cubit.dart';
import 'package:threads_clone/presentation/home/widgets/user-display.widget.dart';
import 'package:threads_clone/core/configs/routes/routes-name.config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: const Icon(Icons.home)),
      ),
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserDisplayStateCubit()..displayUser()),
            BlocProvider(create: (context) => ButtonStateCubit()),
          ],
          child: BlocListener<ButtonStateCubit, ButtonState>(
            listener: (context, state) {
              if (state is ButtonSuccessState) {
                Navigator.pushReplacementNamed(
                  context,
                  RoutesNameConfig.welcomePage,
                );
              }
            },
            child: Column(
              children: [
                const UserDisplayWidget(),
                Builder(builder: (context) {
                  return CustomButton(
                    text: 'Déconnexion',
                    onPressed: () {
                      context.read<ButtonStateCubit>().execute(
                            usecase: LogoutUsecase(),
                          );
                    },
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
