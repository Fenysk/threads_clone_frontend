import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';
import 'package:threads_clone/common/bloc/user/timeline.state-cubit.dart';
import 'package:threads_clone/common/bloc/user/timeline.state.dart';
import 'package:threads_clone/common/widgets/custom_button.widget.dart';
import 'package:threads_clone/data/dto/pagination.request.dart';
import 'package:threads_clone/domain/entities/posts/post.entity.dart';
import 'package:threads_clone/domain/usecases/auth/logout.usecase.dart';
import 'package:threads_clone/presentation/home/bloc/user-display.state-cubit.dart';
import 'package:threads_clone/presentation/home/widgets/post-display.widget.dart';
import 'package:threads_clone/presentation/home/widgets/user-display.widget.dart';
import 'package:threads_clone/core/configs/routes/routes-name.config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: MultiBlocProvider(
        providers: [
          BlocProvider(create: (context) => UserDisplayStateCubit()..displayUser()),
          BlocProvider(
            create: (context) => TimelineStateCubit()
              ..getForYouTimeline(
                request: PaginationRequest(
                  limit: 10,
                  page: 1,
                ),
              ),
          ),
          BlocProvider(create: (context) => ButtonStateCubit()),
        ],
        child: MultiBlocListener(
          listeners: [
            BlocListener<ButtonStateCubit, ButtonState>(
              listener: (context, state) {
                if (state is ButtonSuccessState) {
                  Navigator.pushReplacementNamed(
                    context,
                    RoutesNameConfig.welcomePage,
                  );
                }
              },
            ),
            BlocListener<TimelineStateCubit, TimelineState>(
              listener: (context, state) {
                if (state is TimelineFailureState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.errorMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
            ),
          ],
          child: Column(
            children: [
              const UserDisplayWidget(),
              Expanded(
                child: buildTimeLine(),
              ),
              Builder(
                builder: (context) {
                  return CustomButton(
                    text: 'Déconnexion',
                    onPressed: () => context.read<ButtonStateCubit>().execute(usecase: LogoutUsecase()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTimeLine() {
    return BlocBuilder<TimelineStateCubit, TimelineState>(
      builder: (context, state) {
        if (state is TimelineLoadingState) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is TimelineSuccessState) {
          return SingleChildScrollView(
            child: Column(
              children: List.generate(state.posts.length, (index) {
                final post = state.posts[index];
                return PostDisplayWidget(post: post);
              }),
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
