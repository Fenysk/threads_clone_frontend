import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomButton({super.key, required this.text, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ButtonStateCubit, ButtonState>(
        builder: (context, state) {
      if (state is ButtonLoadingState) {
        return _buildLoading(context);
      } else if (state is ButtonSuccessState) {
        return _buildSuccess(context);
      } else if (state is ButtonFailureState) {
        return _buildFailure(context, state);
      } else {
        return _buildInitial(context);
      }
    });
  }

  Widget _buildLoading(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.grey,
      ),
      child: const CircularProgressIndicator(),
    );
  }

  Widget _buildInitial(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue,
      ),
      child: Text(text),
    );
  }

  Widget _buildSuccess(BuildContext context) {
    return ElevatedButton(
      onPressed: null,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green,
      ),
      child: const Text('Success'),
    );
  }

  Widget _buildFailure(BuildContext context, ButtonFailureState state) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text('Failure: ${state.errorMessage}'),
    );
  }
}
