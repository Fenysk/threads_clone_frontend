import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/text-field/custom-text-field.widget.dart';
import 'package:threads_clone/features/post/3_presentation/bloc/create-post/create-post.cubit.dart';

class CreatePostWidget extends StatelessWidget {
  CreatePostWidget({super.key});

  final _textContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => CreatePostCubit()..loadCurrentUser(),
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          return switch (state) {
            CreatePostInitialState() => buildInitialContent(),
            CreatePostLoadedState() => buildLoadedContent(state, themeData),
            _ => buildInitialContent(),
          };
        },
      ),
    );
  }

  Widget buildInitialContent() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget buildLoadedContent(CreatePostLoadedState state, ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3))),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 20,
                foregroundImage: NetworkImage(state.currentUser.Profile?.avatarUrl ?? ''),
                onForegroundImageError: (exception, stackTrace) {},
                backgroundColor: Colors.grey,
                child: state.currentUser.Profile?.avatarUrl == null
                    ? Text(
                        state.currentUser.Profile?.pseudo?.toUpperCase().substring(0, 2) ?? '',
                        style: themeData.textTheme.labelMedium,
                      )
                    : null,
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  state.currentUser.Profile?.pseudo ?? 'No pseudo',
                  style: themeData.textTheme.labelMedium?.copyWith(
                    height: 1,
                  ),
                ),
                CustomTextField(
                  themeData: themeData,
                  controller: _textContentController,
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FluentIcons.image_multiple_24_regular,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FluentIcons.camera_24_regular,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        FluentIcons.gif_24_regular,
                        color: Colors.grey,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Text(
                        "#",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 24,
                          height: 0,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
