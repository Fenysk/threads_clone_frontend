import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/core/configs/router/routes-name.config.dart';
import 'package:threads_clone/3_presentation/pages/root/bloc/root.state.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/3_presentation/pages/root/bloc/root.cubit.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: BlocProvider<RootCubit>(
          create: (context) => RootCubit()..appStarted(),
          child: BlocBuilder<RootCubit, RootState>(
            builder: (context, state) {
              return switch (state) {
                RootInitialState() => buildInitialContent(),
                RootUnauthenticatedState() => buildUnauthenticatedContent(),
                RootAuthenticatedState() => buildAuthenticatedContent(),
                _ => Container(),
              };
            },
          ),
        ),
      ),
    );
  }

  Widget buildInitialContent() => const Center(child: CircularProgressIndicator());

  Widget buildUnauthenticatedContent() {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.authPage);
        });
        return Container();
      },
    );
  }

  Widget buildAuthenticatedContent() {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.homePage);
        });
        return Container();
      },
    );
  }
}
