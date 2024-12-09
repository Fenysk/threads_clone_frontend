import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state-cubit.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.cubit.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.state.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/user/3_presentation/bloc/user-display.cubit.dart';
import 'package:threads_clone/features/auth/3_presentation/widget/logout-button.widget.dart';
import 'package:threads_clone/features/timeline/3_presentation/widget/timeline-display.widget.dart';
import 'package:threads_clone/features/user/3_presentation/widget/user-display.widget.dart';
import 'package:threads_clone/core/configs/router/routes-name.config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: MultiBlocProvider(
          providers: [
            BlocProvider(create: (context) => UserDisplayCubit()..displayUser()),
            BlocProvider(
              create: (context) => TimelineCubit()
                ..fetchForYouTimeline(
                  request: PaginationRequest(
                    limit: 10,
                    page: 1,
                  ),
                ),
            ),
            BlocProvider(create: (context) => LoadingButtonStateCubit()),
          ],
          child: MultiBlocListener(
            listeners: [
              BlocListener<LoadingButtonStateCubit, LoadingButtonState>(
                listener: (context, state) {
                  if (state is LoadingButtonSuccessState) {
                    GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.authPage);
                  }
                },
              ),
              BlocListener<TimelineCubit, TimelineState>(
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
            child: const Column(
              children: [
                UserDisplayWidget(),
                Expanded(
                  child: TimelineDisplayWidget(),
                ),
                LogoutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
