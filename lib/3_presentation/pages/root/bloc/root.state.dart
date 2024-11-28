import 'package:equatable/equatable.dart';

abstract class RootState extends Equatable {
  const RootState();

  @override
  List<Object?> get props => [];
}

class RootInitialState extends RootState {}

class RootAuthenticatedState extends RootState {}

class RootUnauthenticatedState extends RootState {}
