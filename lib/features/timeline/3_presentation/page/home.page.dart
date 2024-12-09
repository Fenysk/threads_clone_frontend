import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.cubit.dart';
import 'package:threads_clone/features/timeline/3_presentation/bloc/timeline.state.dart';
import 'package:threads_clone/features/timeline/1_data/dto/pagination.request.dart';
import 'package:threads_clone/features/timeline/3_presentation/widget/timeline-display.widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TimelineCubit()
            ..fetchForYouTimeline(
              request: PaginationRequest(
                limit: 10,
                page: 1,
              ),
            ),
        ),
      ],
      child: MultiBlocListener(
        listeners: [
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
        child: DefaultTabController(
          length: 2,
          child: Column(
            children: [
              const SizedBox(height: 16),
              SvgPicture.asset(
                'assets/images/threads.svg',
                colorFilter: ColorFilter.mode(themeData.colorScheme.primary, BlendMode.srcIn),
                height: 40,
              ),
              const TabBar(
                indicatorSize: TabBarIndicatorSize.tab,
                unselectedLabelColor: Colors.grey,
                tabs: [
                  Tab(text: 'For you'),
                  Tab(text: 'Followings'),
                ],
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    TimelineDisplayWidget(),
                    Placeholder(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
