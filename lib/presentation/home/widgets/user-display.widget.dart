import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/presentation/home/bloc/user/user-display.state-cubit.dart';
import 'package:threads_clone/presentation/home/bloc/user/user-display.state.dart';

class UserDisplayWidget extends StatelessWidget {
  const UserDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDisplayStateCubit, UserDisplayState>(
      builder: (context, state) {
        return switch (state) {
          UserDisplayLoaded() => buildLoadedContent(state),
          UserDisplayFailure() => buildFailureContent(state),
          _ => buildLoadingContent(),
        };
      },
    );
  }

  Center buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Center buildFailureContent(UserDisplayFailure state) => Center(child: Text(state.errorMessage));

  Center buildLoadedContent(UserDisplayLoaded state) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Vos informations :',
              style: TextStyle(
                fontSize: 18,
                color: Colors.black.withOpacity(0.7),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              state.user.Profile?.pseudo ?? 'No pseudo',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              state.user.email ?? 'No email',
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
      );
}
