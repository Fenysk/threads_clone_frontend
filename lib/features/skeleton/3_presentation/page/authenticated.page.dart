import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/search/3_presentation/page/search.page.dart';
import 'package:threads_clone/features/skeleton/3_presentation/bloc/tabs_cubit.dart';
import 'package:threads_clone/features/skeleton/3_presentation/widgets/app-navigation-bar.widget.dart';
import 'package:threads_clone/features/timeline/3_presentation/page/home.page.dart';
import 'package:threads_clone/features/user/3_presentation/page/profile.page.dart';

class AuthenticatedPage extends StatelessWidget {
  const AuthenticatedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocProvider(
          create: (context) => TabsCubit(),
          child: BlocBuilder<TabsCubit, TabsState>(
            builder: (context, state) {
              return Column(
                children: [
                  Expanded(
                    child: switch (state) {
                      HomeTab() => const HomePage(),
                      SearchTab() => const SearchPage(),
                      ProfileTab() => ProfilePage(userId: state.userId),
                      _ => buildLoadingContent(),
                    },
                  ),
                  AppBottomNavigationBar(
                    tabState: state,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }

  Widget buildLoadingContent() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}
