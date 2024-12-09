import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state-cubit.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state.dart';

class CustomLoadingButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomLoadingButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoadingButtonStateCubit, LoadingButtonState>(
      builder: (context, state) {
        return switch (state) {
          LoadingButtonLoadingState() => _buildLoading(context),
          LoadingButtonSuccessState() => _buildSuccess(context),
          LoadingButtonFailureState() => _buildFailure(context, state),
          _ => _buildInitial(context),
        };
      },
    );
  }

  Widget _buildLoading(BuildContext context) {
    final themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: () {},
      style: themeData.elevatedButtonTheme.style,
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildInitial(BuildContext context) {
    final themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: themeData.elevatedButtonTheme.style,
      child: Text(
        text,
        style: themeData.textTheme.bodyMedium!.copyWith(color: themeData.primaryColor),
      ),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    final themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: null,
      style: themeData.elevatedButtonTheme.style,
      child: Text(
        'Success',
        style: themeData.textTheme.bodyMedium,
      ),
    );
  }

  Widget _buildFailure(BuildContext context, LoadingButtonFailureState state) {
    final themeData = Theme.of(context);

    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text(
        state.errorMessage,
        style: themeData.textTheme.bodyMedium,
      ),
    );
  }
}
