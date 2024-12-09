import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state-cubit.dart';
import 'package:threads_clone/core/widgets/loading-button/bloc/loading-button.state.dart';
import 'package:threads_clone/core/widgets/loading-button/custom-loading-button.widget.dart';
import 'package:threads_clone/core/configs/router/routes-name.config.dart';
import 'package:threads_clone/features/auth/1_data/dto/login.request.dart';
import 'package:threads_clone/features/auth/2_domain/usecase/login.usecase.dart';
import 'package:threads_clone/service_locator.dart';

class LoginTab extends StatelessWidget {
  final void Function() onGoToRegisterTab;

  LoginTab({
    super.key,
    required this.onGoToRegisterTab,
  });

  final _emailController = TextEditingController(text: 'test@test.test');
  final _passwordController = TextEditingController(text: 'Password1@');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => LoadingButtonStateCubit(),
      child: BlocListener<LoadingButtonStateCubit, LoadingButtonState>(
        listener: (context, state) {
          if (state is LoadingButtonSuccessState) {
            GoRouter.of(context).pushReplacementNamed(RoutesNameConfig.homePage);
          }

          if (state is LoadingButtonFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('Error logging in: ${state.errorMessage}'),
              ),
            );
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                Text(
                  'Login',
                  style: themeData.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _emailController,
                  style: themeData.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: themeData.textTheme.bodyMedium,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  style: themeData.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: themeData.textTheme.bodyMedium,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.lock_outline),
                  ),
                ),
                const SizedBox(height: 24),
                Builder(
                  builder: (buttonContext) {
                    return CustomLoadingButton(
                      text: 'Login',
                      onPressed: () {
                        buttonContext.read<LoadingButtonStateCubit>().execute(
                              usecase: serviceLocator<LoginUsecase>(),
                              params: LoginRequest(
                                email: _emailController.text,
                                password: _passwordController.text,
                              ),
                            );
                      },
                    );
                  },
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: onGoToRegisterTab,
                  child: Text(
                    'Go back to register',
                    style: themeData.textTheme.bodyMedium,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
