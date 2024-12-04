import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.cubit.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.state.dart';

class UserDisplayWidget extends StatelessWidget {
  const UserDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocBuilder<UserDisplayCubit, UserDisplayState>(
      builder: (context, state) {
        return switch (state) {
          UserDisplayLoaded() => buildLoadedContent(state, themeData),
          UserDisplayFailure() => buildFailureContent(state),
          _ => buildLoadingContent(),
        };
      },
    );
  }

  Widget buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Widget buildFailureContent(UserDisplayFailure state) => Center(child: Text(state.errorMessage));

  Widget buildLoadedContent(UserDisplayLoaded state, ThemeData themeData) => Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
        ),
        child: Center(
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
        ),
      );
}
