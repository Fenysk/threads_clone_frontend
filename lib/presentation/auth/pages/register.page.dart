import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';
import 'package:threads_clone/common/widgets/custom_button.widget.dart';
import 'package:threads_clone/data/models/register.request.dart';
import 'package:threads_clone/domain/usecases/register.usecase.dart';
import 'package:threads_clone/presentation/home/home.page.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({super.key});

  final _pseudoController = TextEditingController();

  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
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
                  content:
                      Text('Error creating account: ${state.errorMessage}'),
                ),
              );
            }
          },
          child: SafeArea(
            minimum: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 40),
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                TextField(
                  controller: _pseudoController,
                  decoration: const InputDecoration(
                    labelText: 'Pseudo',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.person_outline),
                  ),
                ),
                const SizedBox(height: 20),
                TextField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.email_outlined),
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 16),
                TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: const InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.lock_outline),
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
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
