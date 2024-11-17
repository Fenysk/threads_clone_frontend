import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/common/bloc/button/button.state-cubit.dart';
import 'package:threads_clone/common/bloc/button/button.state.dart';
import 'package:threads_clone/common/widgets/custom_button.widget.dart';
import 'package:threads_clone/data/dto/login.request.dart';
import 'package:threads_clone/domain/usecases/login.usecase.dart';
import 'package:threads_clone/presentation/auth/tabs/register.tab.dart';
import 'package:threads_clone/presentation/home/pages/home.page.dart';
import 'package:threads_clone/service_locator.dart';

class LoginTab extends StatelessWidget {
  LoginTab({super.key});

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
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
                (route) => false,
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
          child: SingleChildScrollView(
            child: SafeArea(
              minimum: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
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
                        text: 'Login',
                        onPressed: () {
                          buttonContext.read<ButtonStateCubit>().execute(
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
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(
                        context,
                        MaterialPageRoute(builder: (context) => RegisterTab()),
                      );
                    },
                    child: const Text('Go back to register'),
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
