import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/custom-button/custom-button.widget.dart';
import 'package:threads_clone/core/widgets/custom-dropdown/custom-dropdown.widget.dart';
import 'package:threads_clone/core/widgets/custom-dropdown/custom-pop-menu-item.widget.dart';
import 'package:threads_clone/core/widgets/text-field/custom-text-field.widget.dart';
import 'package:threads_clone/features/create-post/2_domain/enum/create-post-visibility.enum.dart';
import 'package:threads_clone/features/create-post/3_presentation/bloc/change_create_post_visibility/change_create_post_visibility_cubit.dart';
import 'package:threads_clone/features/create-post/3_presentation/bloc/change_create_post_visibility/change_create_post_visibility_state.dart';
import 'package:threads_clone/features/post/3_presentation/bloc/create-post/create-post.cubit.dart';
import 'package:threads_clone/features/post/3_presentation/widget/action-buttons/create-post-action-button.dart';

class CreatePostModalWidget extends StatelessWidget {
  final bool isInsideTimeline;

  CreatePostModalWidget({
    super.key,
    this.isInsideTimeline = false,
  });

  final _textContentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CreatePostCubit()..loadCurrentUser(),
        ),
        BlocProvider(
          create: (context) => ChangeCreatePostVisibilityCubit()..getLastOption(),
        ),
      ],
      child: BlocBuilder<CreatePostCubit, CreatePostState>(
        builder: (context, state) {
          return switch (state) {
            CreatePostInitialState() => buildInitialContent(),
            CreatePostLoadedState() => buildLoadedContent(
                context: context,
                isInsideTimeline: isInsideTimeline,
                state: state,
                themeData: themeData,
              ),
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

  Widget buildLoadedContent({
    required BuildContext context,
    required bool isInsideTimeline,
    required CreatePostLoadedState state,
    required ThemeData themeData,
  }) {
    return Container(
      decoration: BoxDecoration(
          border: Border(
        bottom: isInsideTimeline ? BorderSide(color: Colors.grey.withAlpha(76)) : BorderSide.none,
      )),
      child: IgnorePointer(
        ignoring: isInsideTimeline,
        child: Column(
          children: [
            if (!isInsideTimeline) buildHeader(context, themeData),
            buildContentBody(
              isInsideTimeline,
              state,
              themeData,
            ),
            if (!isInsideTimeline) ...[
              const SizedBox(height: 24),
              buildPublishSection(context, themeData),
            ],
          ],
        ),
      ),
    );
  }

  Widget buildHeader(BuildContext context, ThemeData themeData) => Container(
        padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
        decoration: BoxDecoration(
            border: Border(
          bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
        )),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 80,
              child: CustomButton(
                onPressed: Navigator.of(context).pop,
                text: 'Annuler',
              ),
            ),
            Expanded(
              child: Center(
                child: Text(
                  'Nouveau thread',
                  style: themeData.textTheme.bodyMedium,
                ),
              ),
            ),
            SizedBox(
              width: 80,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CustomButton(
                    onPressed: () {},
                    icon: Icon(
                      FluentIcons.more_circle_20_regular,
                      color: themeData.textTheme.bodyMedium?.color,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget buildContentBody(
    bool isInsideTimeline,
    CreatePostLoadedState state,
    ThemeData themeData,
  ) {
    return Padding(
      padding: EdgeInsets.only(
        top: 20,
        bottom: isInsideTimeline ? 10 : 0,
        left: 16,
        right: 16,
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
                Transform.translate(
                  offset: const Offset(-10, 0),
                  child: Row(
                    children: [
                      CreatePostActionButton(
                        onPressed: () {},
                        type: ActionButtonType.medias,
                      ),
                      CreatePostActionButton(
                        onPressed: () {},
                        type: ActionButtonType.camera,
                      ),
                      CreatePostActionButton(
                        onPressed: () {},
                        type: ActionButtonType.gif,
                      ),
                      CreatePostActionButton(
                        onPressed: () {},
                        type: ActionButtonType.hashtag,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildPublishSection(BuildContext context, ThemeData themeData) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: BlocBuilder<ChangeCreatePostVisibilityCubit, ChangeCreatePostVisibilityState>(
              builder: (context, state) {
                return CustomDropdown(
                  displayText: state.displayText,
                  onSelected: context.read<ChangeCreatePostVisibilityCubit>().changeCreatePostVisibility,
                  items: [
                    CustomPopupMenuItem<String>(
                      value: CreatePostVisibilityEnum.everyone.name,
                      child: const Text('Everyone'),
                    ),
                    CustomPopupMenuItem<String>(
                      value: CreatePostVisibilityEnum.followings.name,
                      child: const Text('Profiles you follow'),
                    ),
                    CustomPopupMenuItem<String>(
                      value: CreatePostVisibilityEnum.mentioned.name,
                      child: const Text('Mentioned profiles only'),
                    ),
                  ],
                );
              },
            ),
          ),
          const SizedBox(width: 24),
          CustomButton(
            onPressed: () {},
            text: 'Publier',
          ),
        ],
      ),
    );
  }
}
