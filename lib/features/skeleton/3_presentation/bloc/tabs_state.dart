part of 'tabs_cubit.dart';

sealed class TabsState extends Equatable {
  const TabsState();

  @override
  List<Object> get props => [];
}

final class HomeTab extends TabsState {}

final class SearchTab extends TabsState {}

final class ActivityTab extends TabsState {}

final class ProfileTab extends TabsState {}
