import 'package:equatable/equatable.dart';

abstract class ChangeCreatePostVisibilityState extends Equatable {
  final String displayText;

  const ChangeCreatePostVisibilityState(this.displayText);

  @override
  List<Object> get props => [
        displayText
      ];
}

final class ChangeCreatePostVisibility extends ChangeCreatePostVisibilityState {
  const ChangeCreatePostVisibility(super.displayText);
}
