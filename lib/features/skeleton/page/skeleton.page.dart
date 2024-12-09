import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/auth/3_presentation/bloc/auth.cubit.dart';
import 'package:threads_clone/features/auth/3_presentation/bloc/auth.state.dart';
import 'package:threads_clone/features/auth/3_presentation/page/auth.page.dart';
import 'package:threads_clone/features/timeline/3_presentation/page/home.page.dart';

class SkeletonPage extends StatelessWidget {
  const SkeletonPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit()..appStarted(),
      child: BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          return switch (state) {
            AuthLoadingState() => buildInitialContent(),
            UnauthenticatedState() => buildUnauthenticatedContent(),
            AuthenticatedState() => buildAuthenticatedContent(),
            _ => Container(),
          };
        },
      ),
    );
  }

  Widget buildInitialContent() => const Center(child: CircularProgressIndicator());

  Widget buildUnauthenticatedContent() {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const AuthPage()));
        });
        return Container();
      },
    );
  }

  Widget buildAuthenticatedContent() {
    return Builder(
      builder: (context) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          Navigator.of(context).push(MaterialPageRoute(builder: (_) => const HomePage()));
        });
        return Container();
      },
    );
  }
}
