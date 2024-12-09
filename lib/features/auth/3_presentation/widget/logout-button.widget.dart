import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state-cubit.dart';
import 'package:threads_clone/core/widgets/loading-button/custom-loading-button.widget.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/logout.usecase.dart';

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return CustomLoadingButton(
          text: 'Déconnexion',
          onPressed: () => context.read<LoadingButtonStateCubit>().execute(usecase: LogoutUsecase()),
        );
      },
    );
  }
}
