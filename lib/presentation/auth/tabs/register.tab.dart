import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';
import 'package:threads_clone/common/widgets/custom_button.widget.dart';
import 'package:threads_clone/data/dto/register.request.dart';
import 'package:threads_clone/domain/usecases/register.usecase.dart';
import 'package:threads_clone/presentation/auth/tabs/login.tab.dart';
import 'package:threads_clone/presentation/home/pages/home.page.dart';
import 'package:threads_clone/service_locator.dart';

class RegisterTab extends StatelessWidget {
  RegisterTab({super.key});

  final _pseudoController = TextEditingController(text: 'Test');
  final _emailController = TextEditingController(text: 'test@test.test');
  final _passwordController = TextEditingController(text: 'Password1@');

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
                  content: Text('Error creating account: ${state.errorMessage}',
                      style: Theme.of(context).textTheme.bodyMedium),
                ),
              );
            }
          },
          child: SingleChildScrollView(
            child: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    controller: _pseudoController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: 'Pseudo',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: _emailController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.email_outlined),
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                  const SizedBox(height: 16),
                  TextField(
                    obscureText: true,
                    controller: _passwordController,
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      labelStyle: Theme.of(context).textTheme.bodyMedium,
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => LoginTab()),
                      );
                    },
                    child: Text(
                      'Go to login',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
