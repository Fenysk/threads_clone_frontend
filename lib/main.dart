import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:threads_clone/common/bloc/auth/auth.state-cubit.dart';
import 'package:threads_clone/common/bloc/auth/auth.state.dart';
import 'package:threads_clone/core/configs/routes/routes-name.config.dart';
import 'package:threads_clone/core/configs/routes/routes.config.dart';
import 'package:threads_clone/presentation/auth/welcome.page.dart';
import 'package:threads_clone/presentation/home/pages/home.page.dart';
import 'package:threads_clone/service_locator.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  try {
    await dotenv.load();
  } catch (e) {
    print('Erreur lors du chargement du fichier .env: $e');
  }

  setupServiceLocator();

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AuthStateCubit()..appStarted(),
      child: MaterialApp(
        home: BlocBuilder<AuthStateCubit, AuthState>(
          builder: (context, state) {
            return switch (state) {
              AuthenticatedState() => const HomePage(),
              UnauthenticatedState() => const WelcomePage(),
              _ => Container(),
            };
          },
        ),
        initialRoute: RoutesNameConfig.welcomePage,
        onGenerateRoute: RoutesConfig.generateRoute,
      ),
    );
  }
}
