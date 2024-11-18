import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/user/user-display.state-cubit.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/user/user-display.state.dart';

class UserDisplayWidget extends StatelessWidget {
  const UserDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocBuilder<UserDisplayStateCubit, UserDisplayState>(
      builder: (context, state) {
        return switch (state) {
          UserDisplayLoaded() => buildLoadedContent(state, themeData),
          UserDisplayFailure() => buildFailureContent(state),
          _ => buildLoadingContent(),
        };
      },
    );
  }

  Center buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Center buildFailureContent(UserDisplayFailure state) => Center(child: Text(state.errorMessage));

  Center buildLoadedContent(UserDisplayLoaded state, ThemeData themeData) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vos informations :',
              style: themeData.textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              state.user.Profile?.pseudo ?? 'No pseudo',
              style: themeData.textTheme.headlineLarge,
            ),
            const SizedBox(height: 8),
            Text(
              state.user.email ?? 'No email',
              style: themeData.textTheme.bodyMedium,
            ),
          ],
        ),
      );
}