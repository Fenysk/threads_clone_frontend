import 'package:threads_clone/domain/entities/user/user.entity.dart';

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
