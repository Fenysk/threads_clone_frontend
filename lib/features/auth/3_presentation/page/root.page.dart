import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/configs/router/routes-name.config.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/features/auth/3_presentation/bloc/auth.cubit.dart';
import 'package:threads_clone/features/auth/3_presentation/bloc/auth.state.dart';

class RootPage extends StatelessWidget {
  const RootPage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: true,
        child: BlocProvider<AuthCubit>(
          create: (context) => AuthCubit()..appStarted(),
          child: BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              return switch (state) {
                AuthInitialState() => buildInitialContent(),
                UnauthenticatedState() => buildUnauthenticatedContent(),
                AuthenticatedState() => buildAuthenticatedContent(),
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
