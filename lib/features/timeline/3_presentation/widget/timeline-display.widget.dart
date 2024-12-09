import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/utils/modal.util.dart';
import 'package:threads_clone/features/post/2_domain/entity/post.entity.dart';
import 'package:threads_clone/features/create-post/3_presentation/widget/create-post-modal.widget.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/timeline/1_data/source/timeline-temporary.service.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.cubit.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.state.dart';
import 'package:threads_clone/features/post/3_presentation/widget/post-display.widget.dart';
import 'package:threads_clone/service_locator.dart';

class TimelineDisplayWidget extends StatelessWidget {
  const TimelineDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<TimelineCubit>().fetchForYouTimeline(
              request: PaginationRequest(
                limit: 10,
                page: 1,
              ),
            );
      },
      child: BlocBuilder<TimelineCubit, TimelineState>(
        builder: (context, state) {
          return switch (state) {
            TimelineLoadingState() => buildLoadingContent(),
            TimelineSuccessState() => buildSuccessContent(context, state),
            TimelineFailureState() => buildFailureContent(state),
            _ => Container(),
          };
        },
      ),
    );
  }

  Widget buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Widget buildSuccessContent(BuildContext context, TimelineSuccessState state) {
    final List<PostEntity> timeline = serviceLocator<TimelineTemporaryService>().temporaryPosts;

    return SingleChildScrollView(
      child: Column(
        children: [
          GestureDetector(
            onTap: () => ModalUtil().openBottomDrawer(
              context: context,
              child: CreatePostModalWidget(),
            ),
            child: CreatePostModalWidget(isInsideTimeline: true),
          ),
          ...List.generate(
            timeline.length,
            (index) {
              final post = timeline[timeline.length - 1 - index];
              return PostDisplayWidget(post: post);
            },
          ),
        ],
      ),
    );
  }

  Widget buildFailureContent(TimelineFailureState state) => Center(child: Text(state.errorMessage));
}
