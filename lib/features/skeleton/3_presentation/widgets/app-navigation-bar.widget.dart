import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/features/skeleton/3_presentation/bloc/tabs_cubit.dart';
import 'package:threads_clone/features/skeleton/3_presentation/widgets/navbar-button.widget.dart';
import 'package:threads_clone/features/skeleton/3_presentation/widgets/navbar-create-post-button.widget.dart';

class AppBottomNavigationBar extends StatelessWidget {
  final TabsState tabState;

  const AppBottomNavigationBar({
    super.key,
    required this.tabState,
  });

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => TabsCubit(),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            NavbarButtonWidget(
              type: NavbarButtonType.home,
              isActive: tabState is HomeTab,
              onTap: () => context.read<TabsCubit>().selectTab(NavbarButtonType.home),
            ),
            NavbarButtonWidget(
              type: NavbarButtonType.search,
              isActive: tabState is SearchTab,
              onTap: () => context.read<TabsCubit>().selectTab(NavbarButtonType.search),
            ),
            const NavbarCreatePostButtonWidget(),
            NavbarButtonWidget(
              type: NavbarButtonType.activity,
              isActive: tabState is ActivityTab,
              onTap: () => context.read<TabsCubit>().selectTab(NavbarButtonType.activity),
            ),
            NavbarButtonWidget(
              type: NavbarButtonType.profile,
              isActive: tabState is ProfileTab,
              onTap: () => context.read<TabsCubit>().selectTab(NavbarButtonType.profile),
            ),
          ],
        ),
      ),
    );
  }
}
