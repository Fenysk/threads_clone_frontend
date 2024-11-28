import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';

abstract class UserDisplayState {}

class UserDisplayLoading extends UserDisplayState {}

class UserDisplayLoaded extends UserDisplayState {
  final UserEntity user;

  UserDisplayLoaded({required this.user});
}

class UserDisplayFailure extends UserDisplayState {
  final String errorMessage;

  UserDisplayFailure({required this.errorMessage});
}
