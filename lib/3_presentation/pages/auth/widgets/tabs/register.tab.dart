import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state-cubit.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/custom_button.widget.dart';
import 'package:threads_clone/0_data/dto/register.request.dart';
import 'package:threads_clone/1_domain/usecases/auth/register.usecase.dart';
import 'package:threads_clone/3_presentation/pages/home/home.page.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterTab extends StatelessWidget {
  final VoidCallback onGoToLoginTab;
  RegisterTab({
    super.key,
    required this.onGoToLoginTab,
  });

  final _pseudoController = TextEditingController(text: 'Test');
  final _emailController = TextEditingController(text: 'test@test.test');
  final _passwordController = TextEditingController(text: 'Password1@');

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return BlocProvider(
      create: (context) => ButtonStateCubit(),
      child: BlocListener<ButtonStateCubit, ButtonState>(
        listener: (context, state) {
          if (state is ButtonSuccessState) {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(builder: (context) => const HomePage()),
            );
          }

          if (state is ButtonFailureState) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'Error creating account: ${state.errorMessage}',
                  style: themeData.textTheme.bodyMedium,
                ),
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
                Text(
                  'Create Account',
                  style: themeData.textTheme.headlineMedium,
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _pseudoController,
                  style: themeData.textTheme.bodyMedium,
                  decoration: InputDecoration(
                    labelText: 'Pseudo',
                    labelStyle: themeData.textTheme.bodyMedium,
                    border: const OutlineInputBorder(),
                    prefixIcon: const Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),
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
                    return CustomButton(
                      text: 'Register',
                      onPressed: () {
                        buttonContext.read<ButtonStateCubit>().execute(
                              usecase: serviceLocator<RegisterUsecase>(),
                              params: RegisterRequest(
                                pseudo: _pseudoController.text,
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
                  onPressed: onGoToLoginTab,
                  child: Text(
                    'Go to login',
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
