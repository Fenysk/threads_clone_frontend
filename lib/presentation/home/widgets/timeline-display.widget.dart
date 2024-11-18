import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/user/timeline.state-cubit.dart';
import 'package:threads_clone/common/bloc/user/timeline.state.dart';
import 'package:threads_clone/presentation/home/widgets/post/post-display.widget.dart';

class TimelineDisplayWidget extends StatelessWidget {
  const TimelineDisplayWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TimelineStateCubit, TimelineState>(
      builder: (context, state) {
        if (state is TimelineLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TimelineSuccessState) {
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
        } else if (state is TimelineFailureState) {
          return Center(child: Text(state.errorMessage));
        } else {
          return Container();
        }
      },
    );
  }
}
