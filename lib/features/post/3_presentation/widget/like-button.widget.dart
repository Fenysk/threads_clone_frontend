import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/post/3_presentation/bloc/like/like.cubit.dart';

class LikeButtonWidget extends StatelessWidget {
  final PostEntity post;

  const LikeButtonWidget({super.key, required this.post});

  void onLikeTap(BuildContext context) async {
    if (context.read<LikeButtonCubit>().state is UnlikedState) {
      context.read<LikeButtonCubit>().likePost();
    }
    if (context.read<LikeButtonCubit>().state is LikedState) {
      context.read<LikeButtonCubit>().unlikePost();
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => LikeButtonCubit(post: post)..checkIfLiked(),
      child: Builder(
        builder: (context) {
          return InkWell(
            onTap: () => onLikeTap(context),
            child: BlocBuilder<LikeButtonCubit, LikeButtonState>(
              builder: (context, state) {
                return switch (state) {
                  LikeInitialState() => buildInitialContent(state, themeData),
                  LikeLoadingState() => buildLoadingState(themeData),
                  LikedState() => buildLikedContent(state, themeData),
                  UnlikedState() => buildUnlikedContent(state, themeData),
                  LikeFailureState() => buildFailureContent(state, themeData),
                  _ => const SizedBox.shrink(),
                };
              },
            ),
          );
        },
      ),
    );
  }

  Row buildInitialContent(LikeInitialState state, ThemeData themeData) {
    return Row(
      children: [
        const Icon(FluentIcons.heart_20_regular),
        if (state.likeCount > 0) const SizedBox(width: 4),
        if (state.likeCount > 0) Text('${state.likeCount}', style: themeData.textTheme.bodySmall),
      ],
    );
  }

  Row buildLoadingState(ThemeData themeData) {
    return const Row(
      children: [
        Icon(FluentIcons.heart_20_regular),
        SizedBox(width: 4),
        SizedBox(width: 16, height: 16, child: Center(child: CircularProgressIndicator(strokeWidth: 2))),
      ],
    );
  }

  Row buildLikedContent(LikedState state, ThemeData themeData) {
    return Row(
      children: [
        const Icon(FluentIcons.heart_20_filled, color: Colors.red),
        if (state.likeCount > 0) const SizedBox(width: 4),
        if (state.likeCount > 0) Text('${state.likeCount}', style: themeData.textTheme.bodySmall),
      ],
    );
  }

  Row buildUnlikedContent(UnlikedState state, ThemeData themeData) {
    return Row(
      children: [
        const Icon(FluentIcons.heart_20_regular),
        if (state.likeCount > 0) const SizedBox(width: 4),
        if (state.likeCount > 0) Text('${state.likeCount}', style: themeData.textTheme.bodySmall),
      ],
    );
  }

  Row buildFailureContent(LikeFailureState state, ThemeData themeData) {
    return Row(
      children: [
        const Icon(FluentIcons.heart_20_regular),
        const SizedBox(width: 4),
        Text(state.errorMessage, style: themeData.textTheme.bodySmall),
      ],
    );
  }
}
