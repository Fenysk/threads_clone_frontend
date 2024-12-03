import 'package:equatable/equatable.dart';
import 'package:threads_clone/features/user/2_domain/entity/user.entity.dart';

abstract class UserDisplayState extends Equatable {
  const UserDisplayState();

  @override
  List<Object> get props => [];
}

class UserDisplayLoading extends UserDisplayState {}

class UserDisplayLoaded extends UserDisplayState {
  final UserEntity user;

  const UserDisplayLoaded({required this.user});
}

class UserDisplayFailure extends UserDisplayState {
  final String errorMessage;

  const UserDisplayFailure({required this.errorMessage});
}
