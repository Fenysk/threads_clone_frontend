import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/core/configs/router/routes-name.config.dart';
import 'package:threads_clone/3_presentation/pages/root/bloc/root.state.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/3_presentation/pages/root/bloc/root.state-cubit.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: BlocProvider<RootStateCubit>(
          create: (context) => RootStateCubit()..appStarted(),
          child: BlocBuilder<RootStateCubit, RootState>(
            builder: (context, state) {
              if (state is RootInitialState) {
                return const Center(child: CircularProgressIndicator());
              } else if (state is RootUnauthenticatedState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.authPage);
                });
              } else if (state is RootAuthenticatedState) {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.homePage);
                });
              }
              return Container();
            },
          ),
        ),
      ),
    );
  }
}
