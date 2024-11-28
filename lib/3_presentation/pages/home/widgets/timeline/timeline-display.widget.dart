import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/0_data/dto/pagination.request.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/timeline/bloc/timeline.cubit.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/timeline/bloc/timeline.state.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/post/post-display.widget.dart';

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
            TimelineSuccessState() => buildSuccessContent(state),
            TimelineFailureState() => buildFailureContent(state),
            _ => Container(),
          };
        },
      ),
    );
  }

  Widget buildLoadingContent() => const Center(child: CircularProgressIndicator());

  Widget buildSuccessContent(TimelineSuccessState state) {
    return SingleChildScrollView(
      child: Column(
        children: List.generate(
          state.posts.length,
          (index) {
            final post = state.posts[index];
            return PostDisplayWidget(post: post);
          },
        ),
      ),
    );
  }

  Widget buildFailureContent(TimelineFailureState state) => Center(child: Text(state.errorMessage));
}
