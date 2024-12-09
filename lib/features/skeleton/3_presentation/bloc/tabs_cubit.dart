import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:threads_clone/features/skeleton/3_presentation/widgets/navbar-button.widget.dart';

part 'tabs_state.dart';

class TabsCubit extends Cubit<TabsState> {
  TabsCubit() : super(HomeTab());

  void selectTab(NavbarButtonType type) {
    emit(
      switch (type) {
        NavbarButtonType.home => HomeTab(),
        NavbarButtonType.search => SearchTab(),
        NavbarButtonType.activity => ActivityTab(),
        NavbarButtonType.profile => ProfileTab(),
      },
    );
  }
}
