import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.cubit.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.state.dart';

class UserDisplayWidget extends StatelessWidget {
  final String? userId;

  const UserDisplayWidget({super.key, this.userId});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => UserDisplayCubit()..displayUser(userId: userId),
      child: BlocListener<UserDisplayCubit, UserDisplayState>(
        listener: (context, state) {
          if (state is UserDisplayLoaded) {
            print(state.user.count?.Followers);
          }
        },
        child: BlocBuilder<UserDisplayCubit, UserDisplayState>(
          builder: (context, state) {
            return switch (state) {
              UserDisplayLoaded() => buildLoadedContent(state, themeData),
              UserDisplayFailure() => buildFailureContent(state),
              _ => buildLoadingContent(),
            };
          },
        ),
      ),
    );
  }

  Widget buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Widget buildFailureContent(UserDisplayFailure state) => Center(child: Text(state.errorMessage));

  Widget buildLoadedContent(UserDisplayLoaded state, ThemeData themeData) => Container(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.user.Profile?.displayName ?? 'No displayName',
                      style: themeData.textTheme.headlineLarge,
                    ),
                    Text(
                      state.user.Profile?.pseudo ?? 'No pseudo',
                      style: themeData.textTheme.bodySmall,
                    ),
                  ],
                ),
                const Spacer(),
                AvatarWidget(user: state.user, diameter: 60),
                // TODO: add line to link with answer
              ],
            ),
            const SizedBox(height: 16),
            Text(
              state.user.Profile?.biography ?? 'No biography',
              style: themeData.textTheme.bodySmall,
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                        style: themeData.textTheme.bodySmall?.copyWith(
                          color: Colors.grey,
                          fontSize: 12,
                          letterSpacing: 0.5,
                        ),
                        children: [
                          TextSpan(
                            text: '${state.user.count?.Followers} followers',
                          ),
                          if (state.user.Profile?.link != null && state.user.Profile!.link!.isNotEmpty) ...[
                            const TextSpan(text: ' · '),
                            TextSpan(
                              text: state.user.Profile?.link,
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}

class AvatarWidget extends StatelessWidget {
  final UserEntity user;
  final double diameter;

  const AvatarWidget({
    super.key,
    required this.user,
    required this.diameter,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return CircleAvatar(
      radius: diameter / 2,
      foregroundImage: NetworkImage(user.Profile?.avatarUrl ?? ''),
      onForegroundImageError: (exception, stackTrace) {},
      backgroundColor: Colors.grey,
      child: user.Profile?.avatarUrl == null
          ? Text(
              user.Profile?.pseudo?.toUpperCase().substring(0, 2) ?? '',
              style: themeData.textTheme.labelMedium,
            )
          : null,
    );
  }
}
