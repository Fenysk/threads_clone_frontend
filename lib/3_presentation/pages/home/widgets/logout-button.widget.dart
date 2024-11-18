import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state-cubit.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/custom_button.widget.dart';
import 'package:threads_clone/1_domain/usecases/auth/logout.usecase.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomButton(
          text: 'Déconnexion',
          onPressed: () => context.read<ButtonStateCubit>().execute(usecase: LogoutUsecase()),
        );
      },
    );
  }
}
