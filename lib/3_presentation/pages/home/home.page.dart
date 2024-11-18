import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state-cubit.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state.dart';
import 'package:threads_clone/3_presentation/core/services/theme_service.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/timeline/timeline.state-cubit.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/timeline/timeline.state.dart';
import 'package:threads_clone/0_data/dto/pagination.request.dart';
import 'package:threads_clone/3_presentation/pages/home/bloc/user/user-display.state-cubit.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/logout-button.widget.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/timeline-display.widget.dart';
import 'package:threads_clone/3_presentation/pages/home/widgets/user-display.widget.dart';
import 'package:threads_clone/3_presentation/core/configs/routes/routes-name.config.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
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
                      RoutesNameConfig.authPage,
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
