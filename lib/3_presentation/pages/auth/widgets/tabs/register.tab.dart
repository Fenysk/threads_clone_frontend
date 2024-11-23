import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:threads_clone/1_domain/repository/users.repository.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state-cubit.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/bloc/button.state.dart';
import 'package:threads_clone/3_presentation/core/widgets/button/custom_button.widget.dart';
import 'package:threads_clone/0_data/dto/register.request.dart';
import 'package:threads_clone/1_domain/usecases/auth/register.usecase.dart';
import 'package:threads_clone/3_presentation/pages/home/home.page.dart';
import 'package:threads_clone/service_locator.dart';
import 'dart:async';

class RegisterTab extends StatelessWidget {
  final VoidCallback onGoToLoginTab;

  RegisterTab({
    super.key,
    required this.onGoToLoginTab,
  });

  final _formKey = GlobalKey<FormState>();
  final _pseudoController = TextEditingController(text: 'Test');
  final _emailController = TextEditingController(text: 'test@test.test');
  final _passwordController = TextEditingController(text: 'Password1@');

  Timer? _checkIfPseudoExistDebounce;
  String? checkIfPseudoExistErrorMessage;

  String? _validatePseudo(String? pseudo) {
    if (pseudo == null || pseudo.isEmpty) {
      return 'Pseudo is required';
    }

    return checkIfPseudoExistErrorMessage;
  }

  String? _validateEmail(String? email) {
    if (email == null || email.isEmpty) {
      return 'Email is required';
    }

    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(email)) {
      return 'Invalid email format';
    }

    return null;
  }

  String? _validatePassword(String? password) {
    if (password == null || password.isEmpty) {
      return 'Password is required';
    }

    final passwordRegex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$');
    if (!passwordRegex.hasMatch(password)) {
      return 'Password must contain at least 8 characters, 1 uppercase letter, 1 lowercase letter, 1 number and 1 special character';
    }

    return null;
  }

  Future<void> _checkIfPseudoExist(String pseudo) async {
    _checkIfPseudoExistDebounce?.cancel();

    _checkIfPseudoExistDebounce = Timer(const Duration(milliseconds: 300), () async {
      final result = await serviceLocator<UsersRepository>().checkIfPseudoExist(pseudo);
      checkIfPseudoExistErrorMessage = result.fold((error) => error, (_) => null);
      _formKey.currentState?.validate();
    });
  }

  void _onRegisterPressed(BuildContext buttonContext) async {
    final isValid = _formKey.currentState?.validate() ?? false;

    if (isValid) {
      buttonContext.read<ButtonStateCubit>().execute(
            usecase: serviceLocator<RegisterUsecase>(),
            params: RegisterRequest(
              pseudo: _pseudoController.text,
              email: _emailController.text,
              password: _passwordController.text,
            ),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);

    _formKey.currentState?.validate();

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    'Create Account',
                    style: themeData.textTheme.headlineMedium,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _pseudoController,
                    validator: _validatePseudo,
                    onChanged: _checkIfPseudoExist,
                    style: themeData.textTheme.bodyMedium,
                    decoration: InputDecoration(
                      labelText: 'Pseudo',
                      labelStyle: themeData.textTheme.bodyMedium,
                      border: const OutlineInputBorder(),
                      prefixIcon: const Icon(Icons.person_outline),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _emailController,
                    validator: _validateEmail,
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
                  TextFormField(
                    obscureText: true,
                    controller: _passwordController,
                    validator: _validatePassword,
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
                        onPressed: () => _onRegisterPressed(buttonContext),
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
      ),
    );
  }
}
